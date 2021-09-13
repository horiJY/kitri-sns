package com.kitri.sns.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FeedController {

  // @RequestMapping("")
  // public String feedboard(Model model, Map<String,String> map) {
  //
  // return "feedboard";
  // }

  @GetMapping("")
  public String feedboard() {
    // session.id 없으면 login페이지로 이동

    // 로그인 후 피드 가져오기
    // 1 팔로잉_num>0
    // 2 following 한 사람들의 3일 내의 feed를 가져옴
    // 3 2의 feed를 다 본 경우 내가 팔로잉하는 사람들이 가장 많이 팔로잉한 사람의 feed를 가져옴


    // 1-1 팔로잉_num=0
    // 2-1 최근 3일간 등록된 feed 중에 like수가 많은 수대로 가져옴
    // 3-1 2-1의 피드를 다 본 경우


    return "feedboard";
  }
}
