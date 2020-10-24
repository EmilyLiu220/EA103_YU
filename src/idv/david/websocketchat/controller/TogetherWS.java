package idv.david.websocketchat.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint; // 伺服器端端點
							
							// 不可空白、中文，可在後面追加想要的參數   eg. /TogetherWS/{userName}/{roomID}
@ServerEndpoint("/TogetherWS/{userName}") // 標示為伺服器端點(如同 ServerSocket)
public class TogetherWS {	// 使用 URL 的方式去標示
	
	// 用集合來蒐集連線，此處的 Session 是 websocket 套件的，並非  HTTP 的
	private static final Set<Session> connectedSessions = Collections.synchronizedSet(new HashSet<>());

	/*
	 * 如果想取得HttpSession與ServletContext必須實作
	 * ServerEndpointConfig.Configurator.modifyHandshake()，
	 * 參考https://stackoverflow.com/questions/21888425/accessing-servletcontext-and-httpsession-in-onmessage-of-a-jsr-356-serverendpoint
	 */
	
	// 注意：一定要搭配 annotation。看到  onXXXXX 方法，即當 XXXXX 的時候 (類似於 JS 的  onXXXX())
	@OnOpen				// 此處與上方的 annotation 傳入的參數相同，可更換成會員編號(接收前端拿來的資料及已建立的連線)
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		// 用集合去蒐集已建立的連線(session)
		connectedSessions.add(userSession);
		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
		System.out.println(text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		for (Session session : connectedSessions) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		connectedSessions.remove(userSession);
		String text = String.format("session ID = %s, disconnected; close code = %d; reason phrase = %s",
				userSession.getId(), reason.getCloseCode().getCode(), reason.getReasonPhrase());
		System.out.println(text);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

}
