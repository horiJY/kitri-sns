package com.kitri.sns.controller;

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

@Controller
public class FeedController {
  @Autowired
  private FeedService feedService;

  @GetMapping("")
  public String feedboard(HttpServletRequest req, HttpSession session, Map<String, String> map,
      Model model) {
    // map.put("loginid", session.getAttribute("id").toString());
    map.put("loginid", "okh970526");
    // map.put("loginid", "roses_are_rosie");
    // map.put("loginid", "jennierubyjane");
    List<FeedVO> feedList = null;
    // 팔로잉_num check
    if (feedService.checkFollowing(map) > 0) { // 1 팔로잉_num>0
      // 2 following 한 사람들의 3일 내의 feed를 가져옴(9개 단위로 끊어서)
      map.put("start", "1");
      map.put("end", "9");
      feedList = feedService.getFollowFeeds(map);
      // 3 2의 feed를 다 본 경우 내가 팔로잉하는 사람들이 가장 많이 팔로잉한 사람의 feed를 가져옴
      // > this.morelist();

    } else { // 1-1 팔로잉_num=0
      // 2-1 최근 3일간 등록된 feed 중에 like수가 많은 수대로 가져옴(9개)
      map.put("start", "1");
      map.put("end", "9");
      feedList = feedService.getRandomFeeds(map);
      // 3-1 2-1의 피드에 다음 10개

    }

    for (FeedVO c : feedList) {
      System.out.println(c.toString());
    }
    model.addAttribute("feedList", feedList);
    return "feedboard";
  }

  @RequestMapping("/morelist")
  @ResponseBody
  public List<FeedVO> moreList(String start, String end, Map<String, String> map) {
    map.put("start", start);
    map.put("end", end);
    List<FeedVO> feedList = null;

    feedList = feedService.moreFollowFeeds(map);

    return feedList;
  }
}
