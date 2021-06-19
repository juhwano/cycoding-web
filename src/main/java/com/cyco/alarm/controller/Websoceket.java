package com.cyco.alarm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@Controller
@ServerEndpoint(value="/alarm/{logineduser}")
public class Websoceket {
	
	private static final List<Session> sessionList = new ArrayList<Session>();
    private static final Logger logger = LoggerFactory.getLogger(Websoceket.class);

    //Controller 어노테이션 때문에 자동으로 객체 생성
    public Websoceket() {
    	System.out.println("WebSocket 객체 생성");  	
    }
    
    //웹소켓이 연결되었을 때 호출
	// 웹소켓의 Session 객체는 웹의 Session객체와 다르다
	// 브라우저에서 소켓 접속하면 생성되는 객체로 브라우저가 웹소켓에 접속했을 때의 커넥션 정보가 있다
    @OnOpen
    //public void onOpen(Session session, @PathParam("code")String code, @PathParam("sender")String sender, @PathParam("receiver")String receiver) {
    public void onOpen(Session session, @PathParam("logineduser")String logineduser) {	    	

		session.getUserProperties().put("currentId",logineduser);
		System.out.println("로그인한 유저" + logineduser);
		sessionList.add(session);
		
    }
  
    // 웹소켓으로 메시지가 오면 호출되는 함수
    @OnMessage
    public void onMessage(Session session, String message) throws JsonParseException, JsonMappingException, IOException {  	
        
        try {
        	
        	//클라이언트에서 json 형태의 문자열로 넘어온 메시지를 json 객체로 파싱
        	JSONParser parser = new JSONParser();

        	JSONObject  jsonObj = (JSONObject) parser.parse(message);
        	System.out.println(jsonObj.toString());
        	
        	String code = (String)jsonObj.get("code");
            String receiver = (String)jsonObj.get("receiver");
            
            String msg = "";
            String sender = (String)session.getUserProperties().get("currentId");
            /*
            프로젝트에 초대되었습니다.	PR_IN	프로젝트
            내 프로젝트 지원자가 있습니다	PR_A	회원
            프로젝트에 참여가 승인되었습니다.	PR_S	프로젝트
            프로젝트에 참여가 거절되었습니다.	PR_F	프로젝트
            프로젝트의 상태가 변경되었습니다.(모집,진행,종료)	PR_UP	프로젝트
            님이 나에게 후기를 남겼습니다.	MY_RV	후기
            님과 1대1 대화에 초대되었습니다	CHAT_O	쪽지 수신함
            내 질문에 답변이 달렸습니다.	QNAR	QnA게시판
            */
            
            // 프로젝트에 초대됨
            if(code.equals("PR_IN")){
            	
            	msg = sender + "님께서 회원님을 프로젝트에 초대하셨습니다";
            	
            
            	// 내 프로젝트에 누가 지원함
            } else if(code.equals("PR_A")) {
            	
            	msg = sender + "님께서 회원님의 프로젝트에 지원하셨습니다";
            	
            	// 내가 지원 내역이 승인됨
            } else if(code.equals("PR_S")) {
            	
            	msg = "회원님께서 지원하신 프로젝트의 참여가 승인되었습니다";
            	
            	// 내 지원 내역이 거절됨
            } else if(code.equals("PR_F")) {
            	
            	msg = "회원님께서 지원하신 프로젝트의 참여가 거절되었습니다";
            	
            	// 내가 지원/참여한 프로젝트의 상태가 변경됨(모집/진행/종료)
            } else if(code.equals("PR_UP")) {
            	
            	msg = "회원님의 프로젝트 상태가 변경되었습니다";
            	
            	// 누군가 나에게 후기를남김
            } else if(code.equals("MY_RV")) {
            	
            	msg = sender + "님께서 회원님께 후기를 남기셨습니다";
            	
            	// 회
            } else if(code.equals("QNAR")) {
            	
            	msg = sender + "님께서 회원님의 질문에 답변을 작성했습니다";
            	
            }
           
            
            //메시지 보내는 부분
            for(int i =0; i < sessionList.size(); i++) {
            	
            	System.out.println("세션 " + sessionList.get(i).getUserProperties().get("currentId"));
            	
              if(receiver.equals(sessionList.get(i).getUserProperties().get("currentId"))) {
            	  	
            	   System.out.println(sessionList.get(i).getUserProperties().get("currentId")+"에게 메시지 보내기");
                	
            	  	session.getAsyncRemote().sendText(msg); 
                	
               }
            }
                    
            
        }catch (Exception e) {
            
            System.out.println("오류 : " + e.getMessage());
        }
    }
    
    // 연결 에러 발생시 호출되는 메서드
    @OnError
    public void onError(Throwable e,Session session) {
        e.printStackTrace();
    }
    
    //연결 종료시 호출되는 메서드
    @OnClose
    public void onClose(Session session) {
    	
    	System.out.println("연결해제");
        sessionList.remove(session);
    }



}
