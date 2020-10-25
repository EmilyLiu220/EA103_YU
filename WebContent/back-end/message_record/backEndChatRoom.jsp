<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_auth.model.*"%>
<%@ page import="com.fun_auth.model.*"%>

<%
	EmpVO empVO2 = (EmpVO) session.getAttribute("empVO2");
	List<Emp_authVO> emp_authVO2 = (List<Emp_authVO>) session.getAttribute("emp_authVO2");
	List<Fun_authVO> fun_authVO2 = (List<Fun_authVO>) session.getAttribute("fun_authVO2");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>後台首頁</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/style2.css">
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<!-- Font Awesome JS -->
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/bChat.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<div class="wrapper">

		<!-- Sidebar  -->
		<nav id="sidebar">
			<div class="sidebar-header" style="cursor: default;">
				<h3>
					<c:choose>
						<c:when test="${empVO2.emp_no==null}">
							嗨
						</c:when>
						<c:otherwise>
							 ${empVO2.emp_no}<br>${empVO2.emp_name}
						</c:otherwise>					
					</c:choose>
					，您好！
				</h3>
			</div>

			<ul class="list-unstyled components">
				<li><a href="#">現場點餐</a></li>
				<li><a href="#">現場劃位</a></li>
				<li><a href="#">訂單結帳</a></li>
				<li><a href="#">候位管理</a></li>
				<li class="active"><a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">主管員工專區</a>
					<ul class="collapse list-unstyled" id="pageSubmenu">
						<li><a href="#">員工管理</a></li>
						<li><a href="#">會員管理</a></li>
						<li><a href="#">廣告管理</a></li>
						<li><a href="#">最新消息管理</a></li>
						<li><a href="<%=request.getContextPath()%>/back-end/inform_set/select_is.jsp">通知設定管理</a></li>
						<li><a href="#">評價管理</a></li>
						<li><a href="#">用餐時段管理</a></li>
						<li><a href="<%=request.getContextPath()%>/back-end/seat/editSeat.jsp">桌位管理</a></li>
						<li><a href="#">菜單管理</a></li>
						<li><a href="#">食材管理</a></li>
						<li><a href="#">餐點組成管理</a></li>
						<li><a href="#">食材消耗統計</a></li>
						<li><a href="#">紅利商品管理</a></li>
					</ul>
				</li>
				<li><a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">一般員工專區</a>
					<ul class="collapse list-unstyled" id="homeSubmenu">
						<li><a href="<%=request.getContextPath()%>/back-end/front_inform/empCheckInform.jsp">查看通知</a></li>
						<li><a href="<%=request.getContextPath()%>/back-end/message_record/backEndChatRoom.jsp">查看聊天室訊息</a></li>
						<li><a href="#">訂單派工</a></li>
						<li><a href="#">出餐管理</a></li>
						<li><a href="#">訂餐訂單處理</a></li>
						<li><a href="#">訂餐管理</a></li>
						<li><a href="#">訂單管理</a></li>
						<li><a href="#">訂位管理</a></li>
					</ul>
				</li>
			</ul>

			<ul class="list-unstyled CTAs">
				<c:choose>
					<c:when test="${empVO2.emp_no==null}">
						<li><a href="<%=request.getContextPath()%>/back-end/emp/login.jsp" id="logIn">Log in</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#" id="logOut">Log out</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-dark">
						<i class="fas fa-align-justify"></i>
					</button>
					<div id="titleBig" style="margin: 0 auto; font-size: 30px; font-weight: 800;"><a href="<%=request.getContextPath()%>/back-end/back-index_New.jsp">吃 Pot 吧！員工專區</a></div>
					<div id="rwdShow">
						<button type="button" id="topbarCollapse" class="btn btn-dark"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<i class="fas fa-align-justify"></i>
						</button>
						<div id="titleSmall" style="padding-left: 10px; font-size: 30px; font-weight: 800;"><a href="<%=request.getContextPath()%>/back-end/back-index_New.jsp">吃 Pot 吧！員工專區</a></div>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="nav navbar-nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="#"
									id="empId" style="cursor: default;">
									<c:choose>
										<c:when test="${empVO2.emp_no==null}">
											<span style="color: red; margin-top: 1rem;">嗨，您好！請記得登入喔！</span>
										</c:when>
										<c:otherwise>
											<span>${empVO2.emp_no}&nbsp;&nbsp;&nbsp;${empVO2.emp_name}，您好！</span>
										</c:otherwise>
									</c:choose>
								</a></li>
								<li class="nav-item active"><a class="nav-link" href="#">現場點餐</a></li>
								<li class="nav-item active"><a class="nav-link" href="#">現場劃位</a></li>
								<li class="nav-item active"><a class="nav-link" href="#">訂單結帳</a></li>
								<li class="nav-item active"><a class="nav-link" href="#">候位管理</a></li>
								<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/back-end/back-index_m.jsp">主管員工專區</a></li>
								<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/back-end/back-index_e.jsp">一般員工專區</a></li>
								<li class="nav-item active" style="display: block; padding-top: 0.5rem; padding-bottom: 0.5rem;">
									<c:choose>
										<c:when test="${empVO2.emp_no==null}">
											<div id="topLogIn" style="display: inline-block; width: 90px; text-align: center; margin-left: 10px; border-radius: 5px; background: #424242; color: #ccc; cursor: pointer;" onMouseOver="this.style.color='#fff'; this.style.background='#000';" onMouseOut="this.style.color='#ccc'; this.style.background='#424242';"><a href="<%=request.getContextPath()%>/back-end/emp/login.jsp">Log in</a></div>
										</c:when>
										<c:otherwise>
											<div id="topLogOut" style="display: inline-block; width: 90px; text-align: center; margin-left: 10px; border-radius: 5px; background: #424242; color: #ccc; cursor: pointer;" onMouseOver="this.style.color='#fff'; this.style.background='#000';" onMouseOut="this.style.color='#ccc'; this.style.background='#424242';"><a href="">Log out</a></div>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</nav>

			<%-- 後台聊天室開始，暫時先放假資料喔~不好意思QQ --%>
			<div class="container">
				<div class="messaging">
					<div class="inbox_msg">
						<div class="inbox_people">
							<div class="headind_srch">
								<div class="recent_heading">
									<h4>Recent</h4>
								</div>
								<div class="srch_bar">
									<div class="stylish-input-group">
										<input type="text" class="search-bar" placeholder="Search">
										<span class="input-group-addon">
	   										<button type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
										</span>
									</div>
								</div>
							</div>
							<div class="inbox_chat">
								<div class="chat_list">
									<div class="chat_people">
										<div class="chat_img">
											<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
										</div>
										<div class="chat_ib">
											<h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
											<p>Test, which is a new approach to have all solutions astrology under one roof.</p>
										</div>
									</div>
								</div>
								<div class="chat_list">
									<div class="chat_people">
										<div class="chat_img">
											<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
										</div>
										<div class="chat_ib">
											<h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
											<p>Test, which is a new approach to have all solutions astrology under one roof.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="mesgs">
							<div class="msg_history"></div>
		                    <div class="type_msg">
		                        <div class="input_msg_write">
		                            <input type="text" id="submit_message" class="write_msg" placeholder="Type a message" />
		                            <button class="msg_send_btn" type="button"><img id="sendMsg" src="<%=request.getContextPath()%>/front-end/images/send.png"></button>
		                        </div>
		                    </div>
						</div>
					</div>
				</div>
			</div>
			<%-- 後台聊天室結束 --%>
		</div>
	</div>
	
	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script type="text/javascript">
		<%-- 聊天室 --%>
		var MyPoint = "/Message_RecordWS/emp"; // Java 會先執行 → 所以到 JS 這裡的時候就可以直接用 EL 取值
		var host = window.location.host;
		var path = window.location.pathname;
		var webCtx = path.substring(0, path.indexOf('/', 1));
		var endPointURL = "ws://" + host + webCtx + MyPoint;
	
		var messagesArea = document.getElementsByClassName("msg_history")[0];
		var emp_no = "${empVO2.emp_no}"; // 宣告自己(用來分辨訊息要套用的 CSS)
		var webSocket;	
		
		$(function() {
			// create a websocket
			webSocket = new WebSocket(endPointURL);
			
			webSocket.onopen = function(event) {
				console.log("Connect Success!");
			};
			
			webSocket.onmessage = function(event) {
				var jsonObj = JSON.parse(event.data); // 把發送來的字串資料轉成 json 物件
				if ("open" === jsonObj.type) {
					refreshMemList(jsonObj);
				}else if ("history" === jsonObj.type) { // 這次來的是歷史訊息內容
					messagesArea.innerHTML = '';
						
						var messages = JSON.parse(jsonObj.msgJson);
						for (var i = 0; i < messages.length; i++) {
							var from_msg = document.createElement('div');
							var historyData = JSON.parse(messages[i]);
							var content_msg = document.createElement('div');
							
							if( historyData.sender !== "emp" ) {
								from_msg.setAttribute("class", "incoming_msg");
								var incoming_msg_img = document.createElement('div');
								incoming_msg_img.classList.add("incoming_msg_img");
								var img = document.createElement('img');
								img.setAttribute("src","https://ptetutorials.com/images/user-profile.png");
								img.setAttribute("alt","sunil");
								incoming_msg_img.appendChild(img);
								
								var received_msg = document.createElement('div');
								received_msg.classList.add("received_msg");
								content_msg.classList.add("received_withd_msg");
								
								
								var p = document.createElement('p');
								var span = document.createElement('span');
								span.classList.add("time_date");
								var showMsg = historyData.message;
								var timestamp = historyData.timestamp;
								var readSts = historyData.readSts;
								p.innerHTML = showMsg;
								var dayTime = timestamp.substring(0,10);
								p.setAttribute("title",dayTime);
								var shortTime = timestamp.substring(11,18);
								shortTime = shortTime.replace(/:$/, '');
								span.innerHTML = shortTime;
								
								content_msg.appendChild(p);
								content_msg.appendChild(span);
								received_msg.appendChild(content_msg);
								from_msg.appendChild(incoming_msg_img);
								from_msg.appendChild(received_msg);

							}else{
								from_msg.setAttribute("class", "outgoing_msg");
								var sent_msg = document.createElement('div');
								content_msg.classList.add("sent_msg");
								
								var p = document.createElement('p');
								var span = document.createElement('span');
								span.classList.add("time_date");
								var showMsg = historyData.message;
								var timestamp = historyData.timestamp;
								var readSts = historyData.readSts == 0 ? " 未讀" : " 已讀";
								p.innerHTML = showMsg;
								var dayTime = timestamp.substring(0,10);
								p.setAttribute("title",dayTime);
								var shortTime = timestamp.substring(11,18);
								shortTime = shortTime.replace(/:$/, '');
								span.innerHTML = shortTime + " | " + readSts;
								
								content_msg.appendChild(p);
								content_msg.appendChild(span);
								from_msg.appendChild(content_msg);
							}
							
							messagesArea.appendChild(from_msg); // 將新增的歷史訊息區塊加進 chat 區塊
						}
						messagesArea.scrollTop = messagesArea.scrollHeight;
				} else if ("chat" === jsonObj.type) {
					var from_msg = document.createElement('div');
					var content_msg = document.createElement('div');
					
					if( jsonObj.sender !== "emp" ) {
						from_msg.setAttribute("class", "incoming_msg");
						
						var incoming_msg_img = document.createElement('div');
						incoming_msg_img.classList.add("incoming_msg_img");
						var img = document.createElement('img');
						img.setAttribute("src","https://ptetutorials.com/images/user-profile.png");
						img.setAttribute("alt","sunil");
						incoming_msg_img.appendChild(img);
						
						var received_msg = document.createElement('div');
						received_msg.classList.add("received_msg");
						content_msg.classList.add("received_withd_msg");
						
						
						var p = document.createElement('p');
						var span = document.createElement('span');
						span.classList.add("time_date");
						var showMsg = jsonObj.message;
						var timestamp = jsonObj.timestamp;
						var readSts = jsonObj.readSts;
						p.innerHTML = showMsg;
						var dayTime = timestamp.substring(0,10);
						p.setAttribute("title",dayTime);
						var shortTime = timestamp.substring(11,18);
						shortTime = shortTime.replace(/:$/, '');
						span.innerHTML = shortTime;
						
						content_msg.appendChild(p);
						content_msg.appendChild(span);
						received_msg.appendChild(content_msg);
						from_msg.appendChild(incoming_msg_img);
						from_msg.appendChild(received_msg);
					} else {
						from_msg.setAttribute("class", "outgoing_msg");
						var sent_msg = document.createElement('div');
						content_msg.classList.add("sent_msg");
						
						var p = document.createElement('p');
						var span = document.createElement('span');
						span.classList.add("time_date");
						var showMsg = jsonObj.message;
						var timestamp = jsonObj.timestamp;
						var readSts = jsonObj.readSts == 0 ? " 未讀" : " 已讀";
						p.innerHTML = showMsg;
						var dayTime = timestamp.substring(0,10);
						p.setAttribute("title",dayTime);
						var shortTime = timestamp.substring(11,18);
						shortTime = shortTime.replace(/:$/, '');
						span.innerHTML = shortTime + " | " + readSts;
						
						content_msg.appendChild(p);
						content_msg.appendChild(span);
						from_msg.appendChild(content_msg);
					}
					messagesArea.appendChild(from_msg); // 將新增的訊息區塊加進 chat 區塊
					messagesArea.scrollTop = messagesArea.scrollHeight;
				}
			};
			
			webSocket.onclose = function(event) {
				console.log("Disconnected!");
			};
			

			
			function refreshMemList(jsonObj) {
				var mems = jsonObj.mems; // 取得所有上線中的會員
				var inbox_chat = document.getElementsByClassName("inbox_chat")[0];
				inbox_chat.innerHTML = ''; 
				for (var i = 0; i < mems.length; i++) {
					
					var chat_list = document.createElement('div');
					chat_list.classList.add("chat_list");
					chat_list.setAttribute("id", mems[i]);
					var chat_people = document.createElement('div');
					chat_people.classList.add("chat_people");
					var chat_img = document.createElement('img');
					chat_img.classList.add("chat_img");
					chat_img.setAttribute("src","https://ptetutorials.com/images/user-profile.png");
					chat_img.setAttribute("alt","sunil");
					var chat_ib = document.createElement('div');
					chat_ib.classList.add("chat_ib");
					var h5 = document.createElement('h5');
					h5.innerHTML = mems[i];
					
					chat_ib.appendChild(h5);
					chat_people.appendChild(chat_img);
					chat_people.appendChild(chat_ib);
					chat_list.appendChild(chat_people);
					inbox_chat.appendChild(chat_list);
				}
				
				let chat_lists = document.querySelectorAll('.chat_list');
				
				// 開啟關閉聊天室 
				$(".chat_list").click(function(e) {
					let target = e.currentTarget;
					
					chat_lists.forEach( (e)=>{
						if( e.classList.contains("active_chat")){
							e.classList.toggle("active_chat");
						}
					})
					target.classList.add('active_chat');
					// 抓出聊天紀錄
					var jsonObj = { // 這裡要對應原本的 VO 內容
						"type" : "history", // 等同於一個 "action" 傳進去，去取得歷史訊息
						"sender" : "emp",
						"receiver" : target.id,
						"message" : "",
						"timestamp" : "",
						"emp_no" : emp_no,
						"readSts" : 0
					};
					webSocket.send(JSON.stringify(jsonObj));
				});
				
				// 發送訊息
				$("#sendMsg").click(function() {
					var inputMessage = document.getElementById("submit_message");
					var message = inputMessage.value.trim();
					var mem_no = "";
					chat_lists.forEach( (e)=>{
						if( e.classList.contains("active_chat")){
							mem_no = e.id;
							if (message === "") {
								alert("Input a message");
								inputMessage.focus();
							} else {
								var jsonObj = {
									"type" : "chat",
									"sender" : "emp",
									"receiver" : mem_no,
									"message" : message,
									"timestamp" : new Date().toLocaleString(),
									"emp_no" : emp_no,
									"readSts" : 0
								};
								webSocket.send(JSON.stringify(jsonObj));
								inputMessage.value = "";
								inputMessage.focus();
							}
						}
					})
				});
				
			}
			
		})
		

		
	</script>
	<!-- Popper.JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#sidebar").mCustomScrollbar({
				theme : "minimal"
			});

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar, #content').toggleClass('active');
				$('.collapse.in').toggleClass('in');
				$('a[aria-expanded=true]').attr('aria-expanded', 'false');
			});
		});
	</script>
</body>
</html>