package com.kitri.sns.controller;


import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kitri.sns.feed.service.FeedService;
import com.kitri.sns.feed.vo.FeedVO;

@Controller
public class FeedController {
  @Autowired
  private FeedService feedService;

  @GetMapping("")
  public String feedboard(HttpSession session, Map<String, String> map, Model model) {
    if (session.getAttribute("id") == null)
      return "login";
    map.put("loginid", session.getAttribute("id").toString());
    map.put("start", "1");
    map.put("end", "9");

    List<FeedVO> feedList = null;
    // 1. 팔로잉_num check
    if (feedService.checkFollowing(map) > 0) { // 1 팔로잉_num>0
      // 2 following 한 사람들의 3일 내의 feed를 가져옴(9개 단위로 끊어서)
      feedList = feedService.getFollowFeeds(map);
      // 3 2의 feed를 다 본 경우 내가 팔로잉하는 사람들이 가장 많이 팔로잉한 사람의 feed를 가져옴
      // > this.morelist();

    } else { // 1-1 팔로잉_num=0
      // 2-1 최근 3일간 등록된 feed 중에 like수가 많은 수대로 가져옴(9개)
      feedList = feedService.getRandomFeeds(map);
      // 3-1 2-1의 피드에 다음 10개
      // > this.morelist();
    }

    // 피드 별 댓글 가져와서 추가
    for (FeedVO c : feedList) {
      c.setReplys(feedService.getFeedReplys(c.getFeedId()));
    }
    model.addAttribute("feedList", feedList);

    // // 피드 별 댓글 가져오기 -json객체로 리턴...
    // // jsp에서 jqeury로 하려고 하였으나 키값이 숫자인 상태에서 for문으로 값을 가져오기가 어려움 ex) jsonarray["1"] 이런식으로 가져올 수 있음
    // //
    // Gson gson = new Gson();
    // JsonObject returnjobj = new JsonObject();
    // for (FeedVO c : feedList) {
    // List<ReplyVO> replyList = feedService.getFeedReplys(c.getFeedId());
    //
    // JsonArray jsonArr = new JsonArray();
    // for (ReplyVO r : replyList) {
    // JsonObject innerjobj = new JsonObject();
    // innerjobj.addProperty("member_id", r.getMember_Id());
    // innerjobj.addProperty("seq_no", String.valueOf(r.getSeq_no()));
    // innerjobj.addProperty("reply", r.getReply());
    // innerjobj.addProperty("reg_date", r.getReg_date());
    // jsonArr.add(innerjobj);
    // }
    //
    // // System.out.println(jsonArr);
    // returnjobj.addProperty(String.valueOf(c.getFeedId()), String.valueOf(jsonArr));
    // }
    // model.addAttribute("replyList", returnjobj);

    return "feedboard";
  }

  @RequestMapping("/morelist")
  @ResponseBody
  public List<FeedVO> moreList(HttpSession session, String start, String end,
      Map<String, String> map) {
    map.put("loginid", session.getAttribute("id").toString());

    map.put("start", start);
    map.put("end", end);

    List<FeedVO> feedList = feedService.moreFollowFeeds(map);

    for (FeedVO c : feedList) {
      c.setReplys(feedService.getFeedReplys(c.getFeedId()));
    }

    return feedList;
  }

  @RequestMapping("/feedlike")
  @ResponseBody
  public int feedlike(String feedid, Map<String, String> map) {
    map.put("feedid", feedid);
    return feedService.putFeedLike(map);
  }

}
