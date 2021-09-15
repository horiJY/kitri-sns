package com.kitri.sns.message;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import com.kitri.sns.message.service.MessageService;
import com.kitri.sns.message.vo.FollowVO;
import com.kitri.sns.message.vo.MessageDetailVO;
import com.kitri.sns.message.vo.MessageVO;

@Controller
@RequestMapping("/message")
public class DMController {
	@Autowired
	private MessageService msgService;

	@RequestMapping("/list")
	public String DMList(Model model) {
		String senderId = "jennierubyjane";

		// 들어온 dmList 값 시간 순 정렬해주기
		List<MessageVO> dmList = msgService.selectMsgList(senderId);

		JSONObject jsonObj = new JSONObject();

		for (int i = 0; i < dmList.size(); i++) {
			JSONArray jsonArr = new JSONArray();

			jsonArr.add(dmList.get(i).getId1());
			jsonArr.add(dmList.get(i).getId2());
			jsonArr.add(dmList.get(i).getDay());
//			jsonArr.add(dmList.get(i).getPath());
			jsonArr.add(dmList.get(i).getLastMsg());

			if ((dmList.get(i).getId1()).equals(senderId)) {
				if (!jsonObj.containsKey(dmList.get(i).getId2())) {
					jsonObj.put(dmList.get(i).getId2(), jsonArr);
				}
			} else {
				if (!jsonObj.containsKey(dmList.get(i).getId1())) {
					jsonObj.put(dmList.get(i).getId1(), jsonArr);
				}
			}
		}
		model.addAttribute("dmList", jsonObj.toString());
		return "dmboard";
	}

	@RequestMapping("/detail")
	@ResponseBody
	public String DMDetail(String senderId, String receiverId, String day, Model model) throws Exception {

//		String senderId = mvo.getId1();
//		String receiverId = mvo.getId2();
//		String day = mvo.getDay();
		String path = "C:\\Users\\kitri\\git\\kitri-sns\\sns-kitri\\src\\main\\webapp\\resources\\dmfile";

		String path1 = path + File.separator + senderId + "-" + receiverId + "-" + day + ".txt";
		String path2 = path + File.separator + receiverId + "-" + senderId + "-" + day + ".txt";

		File file = new File(path1);
		File file2 = new File(path2);
		int insertResult = 0;
		
		Map<String, String> map = new HashMap<>();
		map.put("id1", senderId);
		map.put("id2", receiverId);
		
		List<MessageVO> msgList = msgService.selectMessageDetail(map);
		
		if (!file.exists() && !file2.exists()) {
			String lastMsg = "";

			MessageVO mvo = new MessageVO();
			mvo.setId1(senderId);
			mvo.setId2(receiverId);
			mvo.setPath(path1);
			mvo.setLastMsg(lastMsg);
			insertResult = msgService.insertMessage(mvo);

			if (insertResult != 0) {
				file.createNewFile();
			} 
		}else {
			path1 = msgList.get(0).getPath();
		}
		
		msgList = msgService.selectMessageDetail(map);
		List<MessageDetailVO> msgDetail = new ArrayList<MessageDetailVO>();
		
		JSONParser parser = new JSONParser();
		JSONArray jArr = new JSONArray();
		for (int i = 0; i < msgList.size(); i++) {
			BufferedReader read = null;
			if (!file.exists() && file2.exists()) {
				read = new BufferedReader(new FileReader(msgList.get(i).getPath()));
			} else {
				read = new BufferedReader(new FileReader(msgList.get(i).getPath()));
			}
			
			String line = "";
			
			while ((line = read.readLine()) != null) {
//				MessageDetailVO mdvo = new MessageDetailVO();
//				
//				Object obj = parser.parse(read);
//				
//				JSONObject jsonObject = (JSONObject) obj;
//
//				mdvo.setSender((String) jsonObject.get("senderId"));
//				mdvo.setReceiver((String) jsonObject.get("receiverId"));
//				mdvo.setTime((String) jsonObject.get("time"));
//				mdvo.setMsg((String) jsonObject.get("msg"));
//
//				msgDetail.add(mdvo);
				
				jArr.add(read.readLine());
				
			}
			for(int j = 0; j < jArr.size(); j++) {
				System.out.println(j + " : " + jArr.get(j));
			}
		}
		
		Gson gson = new Gson();

		model.addAttribute("dmDetail", gson.toJson(msgDetail));

		return "dmboard";
	}

	@RequestMapping("/dmsearch")
	@ResponseBody
	public String DMSearch(Model model, String memberId) {

		List<FollowVO> followList = msgService.selectFollowList("jennierubyjane");
		Gson gson = new Gson();

		model.addAttribute("followList", gson.toJson(followList));

		return "searchtest";
	}
}
