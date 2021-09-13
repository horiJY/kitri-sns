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
	
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// id1, id2 값 받아서 db에 없으면 생성
		// 아이디 두 개 값 받아서 db에 이전 대화기록 있을 시 가장 최근 3개의 path의 파일 가져오기
		// path : file : json : 값 dmboard.jsp 전송
		
		Map<String, Object> map;
		map = session.getAttributes();

		Map<String, Object> sessionMap = new HashMap<String, Object>();
		
		
		String senderId = (String) map.get("senderId");
		String receiverId = (String) map.get("receiverId");
		String context = (String)map.get("path");
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		Date today = new Date();
		String tdy = format1(today);
		
		String path1 = context + senderId + "_" + receiverId + "_" + tdy;
		String path2 = context + receiverId + "_" + senderId + "_" + tdy;
		
		sessionMap.put("senderId", senderId);
		sessionMap.put("receiverId", receiverId);
		sessionMap.put(session.getId(), session);
		sessionList.add(sessionMap);
		
		map.put("senderId", senderId);
		map.put("receiverId", receiverId);
		
		List<MessageVO> msgList = msgService.getMessageDetail(map);
		
		//파일 경로 : C://..... + path1으로 변경하기
		
		
		File file = new File(path1);
		File file2 = new File(path2);
		int insertResult = 0;
		
		if(!file.exists() && !file2.exists()) {
			String lastMsg = "";
			
			MessageVO mvo = new MessageVO();
			mvo.setId1(senderId);
			mvo.setId2(receiverId);
			mvo.setPath(path1);
			mvo.setLastMsg(lastMsg);
			insertResult = msgService.insertMessage(mvo);
			
			if(insertResult != 0) { 
				file.createNewFile();
			}
		}else {
			path1 = msgList.get(0).getPath();
		}
		List<MessageDetailVO> msgDetail = new ArrayList<MessageDetailVO>();
		JsonParser parser = new JsonParser();
		
		for(int i = 0; i < msgList.size(); i++) {
			BufferedReader read = null;
			if(!file.exists() && file2.exists()) {
				read = new BufferedReader(new FileReader(msgList.get(i).getPath()));
			}else {
				read = new BufferedReader(new FileReader(msgList.get(i).getPath()));
			}
			String line = null;
			while((line = read.readLine()) != null) {
				MessageDetailVO mdvo = new MessageDetailVO();
				Object obj = parser.parse(read); 
				JSONObject jsonObject = (JSONObject)obj;
				
				mdvo.setSender((String)jsonObject.get("sender"));
				mdvo.setReceiver((String)jsonObject.get("receiver"));
				mdvo.setTime((String)jsonObject.get("time"));
				mdvo.setMsg((String)jsonObject.get("msg"));
				
				msgDetail.add(mdvo);
			}
		}
		Gson gson = new Gson();
		
		session.sendMessage(new TextMessage(gson.toJson(msgDetail)));
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
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
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
