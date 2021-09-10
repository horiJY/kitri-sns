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

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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

public class DMHandler extends TextWebSocketHandler {
	@Autowired
	private MessageService msgService;
	
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// id1, id2 값 받아서 db에 없으면 생성
		// 아이디 두 개 값 받아서 db에 이전 대화기록 있을 시 가장 최근 3개의 path의 파일 가져오기
		// path : file : json : 값 dmboard.jsp 전송
		
		Map<String, Object> sessionMap = new HashMap<String, Object>();
		Map<String, String> map = new HashMap<String, String>();
		
		String senderId = "";
		String receiverId = "";
		
		sessionMap.put("senderId", senderId);
		sessionMap.put("receiverId", receiverId);
		sessionMap.put(session.getId(), session);
		sessionList.add(sessionMap);
		
		map.put("senderId", senderId);
		map.put("receiverId", receiverId);
		
		List<MessageVO> msgList = msgService.getMessageDetail(map);
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		Date today = new Date();
		String tdy = format1(today);
		
		String path = senderId + "_" + receiverId + "_" + tdy;
		String path2 = receiverId + "_" + senderId + "_" + tdy;
		
		File file = new File(path);
		File file2 = new File(path2);
		int insertResult = 0;
		
		if(!file.exists() && !file2.exists()) {
			String lastMsg = "";
			
			MessageVO mvo = new MessageVO();
			mvo.setId1(senderId);
			mvo.setId2(receiverId);
			mvo.setPath(path);
			mvo.setLastMsg(lastMsg);
			insertResult = msgService.insertMessage(mvo);
			
			if(insertResult != 0) {
				file.createNewFile();
			}
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
	
	private String format1(Date today) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 전송버튼 클릭 or 엔터 입력 시 쓰여져 있는 내용 json으로 path의 파일에 저장 및 화면에 보여주기
		// path : file : json : 저장
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//연결 끊기
	}
}
