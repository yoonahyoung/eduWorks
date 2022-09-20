package com.finalProject.eduWorks.common.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalProject.eduWorks.common.model.service.AlarmService;
import com.finalProject.eduWorks.common.model.vo.AlarmData;
import com.finalProject.eduWorks.member.model.vo.Member;

@Controller // db에 값을 저장하기 위함
public class ReplyEchoHandler extends TextWebSocketHandler {
	@Autowired
	private AlarmService aService;
	private final ObjectMapper objectMapper = new ObjectMapper();
	// 로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<>();
	// 1대1
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	// 커넥션이 연결 됐을 때 (클라이언트가 서버에 접속 했을 때)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		//System.out.println("커넥션 연결 " + session);
		sessions.add(session);
		String senderId = getId(session);
		
		userSessions.put(senderId , session);
		
	}
	
	// 소켓에 메세지를 보냈을 때
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		//System.out.println("메시지 받음 " + session + " : " + message);
		String senderId = getId(session);
		 
		String msg = message.getPayload(); // jsp에서 넘어온 msg
		// JSON -> Java 객체 
		AlarmData alarmData = objectMapper.readValue(msg, AlarmData.class);
		//System.out.println(alarmData);
		
		
		if(alarmData != null) {
			System.out.println("if문 들어옴?");
			
			// 댓글 알람
			// protocol : reply, 글번호, 글 제목, 게시글 작성자, 댓글 단사람, 원댓단사람 
			//System.out.println("성공?");
			// 원댓글만 작성 됐을 시 작성자한테만 알람, 대댓글 달리면 댓글 단 사람한테도 알람
			WebSocketSession boardWriterSession = userSessions.get(alarmData.getBoardWriter());
			TextMessage tmpMsg = new TextMessage("[" + alarmData.getBoardTitle() + "] 게시글에 댓글이 달렸습니다!");
			alarmData.setAlarmContent("[" + alarmData.getBoardTitle() + "] 게시글에 댓글이 달렸습니다!");
			// DB에 저장한다.
            int result = aService.insertAlarm(alarmData);
           
            if(result > 0) { 
            	//System.out.println("메세지 전송 및 DB 저장 성공");
            	boardWriterSession.sendMessage(tmpMsg);
            }else {
                //System.out.println("메세지 전송 실패!!! & DB 저장 실패!!");
            }
		}
		
	}
	
	// 커넥션이 닫혔을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		//System.out.println("커넥션 닫힘 " + session + ", " + status);
	}
	
	// 로그인 유저 번호 알아내기
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = new Member();
		loginUser = (Member)httpSession.get("loginUser");
		
		if(loginUser == null) {
			return session.getId();
		}else {
			return loginUser.getMemNo();
		}
	}

}
