package com.kitri.sns.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kitri.sns.post.service.PostImgService;

@Controller
public class FileUploadController {

  @Autowired
  private PostImgService postService;


  // 1.파일 개수 이름 확인
  // 2. 파일 경로 확인(없으면 생성) > 2개이상 시 file List를 다 돌아야지 전체경로를 가져올 수 있음
  // 3. db insert 전 feed id 가져와서 폴더 생성 > insert 전에 id값을 가져올 수 없음.
  // 4. 파일 업로드,

  @RequestMapping(value = "/fileupload", method = RequestMethod.POST)
  public String upload(MultipartHttpServletRequest multiPart, String content,
      Map<String, String> map, HttpSession session, RedirectAttributes rdat) {
    List<MultipartFile> fileList = multiPart.getFiles("uploadfile");
    String imgUploadFiles = "";
    int cnt = 0;
    for (MultipartFile mf : fileList) { // file 경로 가져오기
      if ((cnt++) != 0)
        imgUploadFiles += ",";
      imgUploadFiles += System.currentTimeMillis() + "_" + mf.getOriginalFilename(); // 서버에 저장되고 DB에
                                                                                     // 들어갈 파일 명들
    }
    map.put("loginid", session.getAttribute("id").toString());
    // map.put("loginid", "luxy");
    map.put("uploadfilepaths", imgUploadFiles);
    map.put("content", content);
    String feedid = postService.registPostImg(map);
    if (!feedid.equals("업로드실패")) {

      // 서버 실제 폴더받아온 피드 번호 추가(업로드 디렉터리)
      // req.getReaulPath는 eclipse tomcat경로로 잡히게 된다.
      String uploadPath = session.getServletContext().getRealPath("/image/members/")
          + map.get("loginid") + "/" + feedid;
      // String uploadPath =
      // "C:/Users/kitri/Desktop/kitri-sns/sns-kitri/src/main/webapp/image/members/"
      // + map.get("loginid") + "/" + feedid;
      File checkDirectory = new File(uploadPath);
      if (!checkDirectory.exists()) {
        checkDirectory.mkdirs();

        for (MultipartFile mf : fileList) {
          String originalFileName = mf.getOriginalFilename(); // 원본 파일명
          File saveFile = new File(uploadPath, System.currentTimeMillis() + "_" + originalFileName);
          System.out.println("업로드 위치 :" + saveFile);
          try {
            mf.transferTo(saveFile);
          } catch (IllegalStateException e) {
            e.printStackTrace();
          } catch (IOException e) {
            e.printStackTrace();
          }

        }
      }
    }

    // 폼 형식의 문서를 작성 후 post로 보내 처리한 뒤 redirect를 하게되면 get방식으로 인해 request의 파라미터가 url뒤에 모두 붙게 된다 이를
    // 처리해주기 위해 addFlashAttribute를 사용한다.
    // https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/servlet/mvc/support/RedirectAttributes.html
    rdat.addFlashAttribute("msg", "success");
    return "redirect:/";
  }
}
