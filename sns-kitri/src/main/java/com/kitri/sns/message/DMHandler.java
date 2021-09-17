package com.kitri.sns.message;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.kitri.sns.message.service.MessageService;
import com.kitri.sns.message.vo.MessageDetailVO;
import com.kitri.sns.message.vo.MessageVO;

@RequestMapping("/detail")
public class DMHandler extends TextWebSocketHandler {
   @Autowired
   private MessageService msgService;
   
//   private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
   
   private Map<String, WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();
   
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      sessionList.put(session.getId(), session);
   }
   
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      // 전송버튼 클릭 or 엔터 입력 시 쓰여져 있는 내용 json으로 path의 파일에 저장 및 화면에 보여주기
      // path : file : json : 저장
      ObjectMapper objectMapper = new ObjectMapper();
      
      Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
      
      String senderId = mapReceive.get("senderId");
      String receiverId = mapReceive.get("receiverId");
      String msg = mapReceive.get("msg");
      String path = mapReceive.get("path");
      
      SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd HH:mm:ss");
      Date today = new Date();

      JSONObject obj = new JSONObject();
      obj.put("sender", senderId);
      obj.put("receiver", receiverId); 
      obj.put("time", today);
      obj.put("msg", msg);
      try { 
         FileWriter file = new FileWriter(path); 
         file.write(obj.toJSONString()); 
         file.flush(); 
         file.close(); 
      } catch (IOException e) {
            e.printStackTrace(); 
      }

   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      sessionList.remove(session);
   }
   
   private String format1(Date today) {
      // TODO Auto-generated method stub
      return null;
   }
}
