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
@ServerEndpoint(value="/websocket/{logineduser}")
public class Websoceket {
	
	private static final List<Session> sessionList = new ArrayList<Session>();
    private static final Logger logger = LoggerFactory.getLogger(Websoceket.class);

    //Controller 어노테이션 때문에 자동으로 객체 생성
    public Websoceket() {
    	System.out.println("WebSocket 객체 생성");
    	
    }

    @OnOpen
    public void onOpen(Session session, @PathParam("logineduser")String logineduser) {	    	

		session.getUserProperties().put("currentId",logineduser);
		System.out.println("로그인한 유저" + logineduser);
		sessionList.add(session);
		
    }
  
    // 웹소켓으로 메시지가 오면 호출되는 함수
    @OnMessage
    public void onMessage(String message, Session session) throws JsonParseException, JsonMappingException, IOException {  	
        
        try {
        	
        	//클라이언트에서 json 형태의 문자열로 넘어온 메시지를 json 객체로 파싱
        	JSONParser parser = new JSONParser();

        	JSONObject  jsonObj = (JSONObject) parser.parse(message);
        	System.out.println(jsonObj.toString());
        	
        	String code = (String)jsonObj.get("alarm_CODE");
            String receiver = (String)jsonObj.get("member_ID");
            String msg = "";           
            jsonObj.put("sender", session.getUserProperties().get("currentId"));
            //메시지 보내는 부분
            for(int i =0; i < sessionList.size(); i++) {
            	
              if(receiver.equals(sessionList.get(i).getUserProperties().get("currentId"))) {
            	  	
            	   System.out.println(sessionList.get(i).getUserProperties().get("currentId")+"에게 메시지 보내기");
            	   sessionList.get(i).getAsyncRemote().sendText(jsonObj.toJSONString());
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
