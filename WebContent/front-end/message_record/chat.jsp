<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/friendchat.css" type="text/css" />
<style type="text/css">

</style>
<title>最大私人聊天室</title>
</head>
<body onload="connect();" onunload="disconnect();">
	<h3 id="statusOutput" class="statusOutput"></h3>
	<div id="row"></div>
	<div id="messagesArea" class="panel message-area" ></div>
	<div class="panel input-area">
		<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" /> 
		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" /> 
		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" /> 
		<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" />
	</div>
</body>
<script>
	var MyPoint = "/FriendWS/${userName}"; // Java 會先執行 → 所以到 JS 這裡的時候就可以直接用 EL 取值
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${userName}'; // 宣告自己(用來分辨訊息要套用的 CSS)
	var webSocket;

	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('connect').disabled = true;
			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data); // 把發送來的字串資料轉成 json 物件
			if ("open" === jsonObj.type) {
				refreshFriendList(jsonObj); // 刷新好友列表(當有其他人上線或離線時都會呼叫這個動作...我不需要XD)
			} else if ("history" === jsonObj.type) { // 這次來的是歷史訊息內容
				messagesArea.innerHTML = '';
				var ul = document.createElement('ul');
				ul.id = "area";
				messagesArea.appendChild(ul); // 將新增的歷史訊息區塊加進 chat 區塊
				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					var showMsg = historyData.message;
					var li = document.createElement('li');
					// 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
					historyData.sender === self ? li.className += 'me' : li.className += 'friend'; // 區分為自己或對方後再套用不同的 CSS 樣式
					li.innerHTML = showMsg;
					ul.appendChild(li);
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("chat" === jsonObj.type) {
				var li = document.createElement('li');
				// 根據發送者是自己還是對方來給予不同的class名，以達到訊息左右區分 (是好友還是自己，會套用不同的樣式<並給 class 以方便做套用 CSS 的動作>)
				jsonObj.sender === self ? li.className += 'me' : li.className += 'friend';
				li.innerHTML = jsonObj.message;
				console.log(li);
				document.getElementById("area").appendChild(li);
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("close" === jsonObj.type) {
				refreshFriendList(jsonObj);
			}
			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else if (friend === "") {
			alert("Choose a friend");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender" : self,
				"receiver" : friend,
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	// 有好友上線或離線就更新列表....我好像也不需要這塊事件，但需要這個 function 的最後一行，點擊某對象時要出現與該隊像的歷史訊息
	function refreshFriendList(jsonObj) {
		var friends = jsonObj.users; // 取得所有上線中的會員
		var row = document.getElementById("row");
		row.innerHTML = ''; // 這裡是把旁邊線上好友列表的內容先清空，再在下方把目前在線好友 for-each 放進去
		for (var i = 0; i < friends.length; i++) {
			if (friends[i] === self) { continue; } // 如果拿出來的名字是自己 → 跳過，如果不是就會增加 row
			row.innerHTML +='<div id=' + i + ' class="column" name="friendName" value=' + friends[i] + ' ><h2>' + friends[i] + '</h2></div>';
			// 好友列表動態產生...我只需要去撈資料庫看有沒有歷史訊息，有歷史訊息就要把該會員放到這裡面(back-end ChatRoom)
		}
		addListener(); // 點擊的監聽動作 ( 出現與該點擊對象的歷史訊息 )
	}
	
	// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
	function addListener() {
		var container = document.getElementById("row"); // 註冊外面的 row，事件觸發就會捕獲下一層下一層然後再傳上來傳上來
		container.addEventListener("click", function(e) {
			var friend = e.srcElement.textContent;
			updateFriendName(friend);
			var jsonObj = { // 這裡要對應原本的 VO 內容
					"type" : "history", // 等同於一個 "action" 傳進去，去取得歷史訊息
					"sender" : self,
					"receiver" : friend,
					"message" : ""
				};
			webSocket.send(JSON.stringify(jsonObj));
		});
	}
	
	function disconnect() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
</script>
</html>