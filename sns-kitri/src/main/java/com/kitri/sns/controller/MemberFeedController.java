package com.kitri.sns.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kitri.sns.feed.service.FeedService;
import com.kitri.sns.feed.vo.FeedVO;
import com.kitri.sns.login.service.MemberService;
import com.kitri.sns.login.vo.MemberVO;
import com.kitri.sns.post.service.PostImgService;

@Controller
public class MemberFeedController {
  @Autowired
  private FeedService feedService;

  @Autowired
  private MemberService memberService;

  @Autowired
  private PostImgService postService;

  @GetMapping("/detail/*")
  public String memberFeedList(HttpSession session, Map<String, String> map, Model model,
      HttpServletRequest request) {

    String id = request.getRequestURI().substring(12);

    map.put("id", id);

    List<FeedVO> feedList = feedService.getMemberDetailFeeds(map);

    List<MemberVO> memberInfo = memberService.selectMemberInfo(id);

    Map<String, Object> infoList = new HashMap<String, Object>();

    infoList.put("memberId", id);
    infoList.put("name", memberInfo.get(0).getName());
    infoList.put("following", memberInfo.get(0).getFollowing());
    infoList.put("follower", memberInfo.get(0).getFollower());
    infoList.put("introduce", memberInfo.get(0).getIntroduce());
    infoList.put("feedsCnt", postService.memberFeedsCnt(id));

    model.addAttribute("infoList", infoList);
    model.addAttribute("feedList", feedList);

    return "memberfeed";
  }

  @RequestMapping("/morefeedlist")
  @ResponseBody
  public List<FeedVO> morefeedList(HttpSession session, String start, String end,
      Map<String, String> map) {
    map.put("loginid", session.getAttribute("id").toString());
    map.put("start", start);
    map.put("end", end);
    List<FeedVO> feedList = feedService.getMemberFeeds(map);

    return feedList;
  }
}
