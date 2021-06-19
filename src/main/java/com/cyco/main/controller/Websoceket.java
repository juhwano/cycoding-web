package com.cyco.main.controller;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.URI;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Async;
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

        	JSONParser parser = new JSONParser();

        	JSONObject  jsonObj = (JSONObject) parser.parse(message);
        	System.out.println(jsonObj.toString());
        	
        	String code = (String)jsonObj.get("code");
            //String sender = mapReceive.get("sender");
            String receiver = (String)jsonObj.get("receiver");
           

            for(int i =0; i < sessionList.size(); i++) {
            	
            	System.out.println("세션 " + sessionList.get(i).getUserProperties().get("currentId"));
            	
              if(receiver.equals(sessionList.get(i).getUserProperties().get("currentId"))) {
            	  	
            	   System.out.println(sessionList.get(i).getUserProperties().get("currentId")+"에게 메시지 보내기");
                	
            	  	session.getAsyncRemote().sendText("코드 : "+code+ " 수신인 : " + receiver); 
                	
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

        sessionList.remove(session);
    }



}
