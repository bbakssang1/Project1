package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import data.dto.LookbookDto;
import data.dto.ProductDto;
import data.dto.ProductOpDto;
import data.mapper.LookMapper;
import data.mapper.ShopMapper;
import data.service.LookService;
import data.service.ShopService;

@Controller
public class LookController {

  @Autowired
  LookMapper mapper;
  @Autowired
  ShopMapper smapper;
  @Autowired
  LookService service;
  @Autowired
  ShopService sservice;

  @GetMapping("/lookbook/lookbookmain")
  public ModelAndView lookbookMain(@RequestParam(defaultValue = "1") int currentPage) {
    ModelAndView mview = new ModelAndView();
    int totalCount = service.getTotalCount();

    // 페이징 처리에 필요한 변수선언
    int perPage = 8;// 한페이지에 보여질 글의 갯수
    int totalPage;// 총 페이지수
    int start;// 각페이지에서 불러올 db의 시작번호
    int perBlock = 5;// 몇개의 페이지번호씩 표현할것인가
    int startPage;// 각 블럭에 표시할 시작페이지
    int endPage;// 각 블럭에 표시할 마지막페이지

    // 총 페이지 갯수 구하기
    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
    // 각 블럭의 시작페이지
    startPage = (currentPage - 1) / perBlock * perBlock + 1;
    endPage = startPage + perBlock - 1;
    if (endPage > totalPage)
      endPage = totalPage;
    // 각 페이지에서 불러올 시작번호
    start = (currentPage - 1) * perPage;
    // 각페이지에서 필요한 게시글 가져오기
    List<LookbookDto> list = service.getAllLists(start, perPage);

    // 각 페이지에 출력할 시작번호
    int no = totalCount - (currentPage - 1) * perPage;

    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("list", list);
    mview.addObject("startPage", startPage);
    mview.addObject("endPage", endPage);
    mview.addObject("totalPage", totalPage);
    mview.addObject("no", no);
    mview.addObject("currentPage", currentPage);

    mview.addObject("totalCount", totalCount);
    mview.setViewName("/lookbook/lookbookmain");
    // mview.setViewName("/shop/shopdetails");
    return mview;
  }

  @GetMapping("/lookbook/lookbookform")
  public ModelAndView LookbookForm(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
    ModelAndView mview = new ModelAndView();

    // 최신글 하단에 출력
    int totalCount = service.getTotalCount();
    int option_list = 99;
    int start;
    start = (currentPage - 1) * option_list;
    List<LookbookDto> list = service.getAllLists(start, option_list);


    // 출력에 필요한 변수들을 request에 저장

    mview.addObject("list", list);

    mview.addObject("currentPage", currentPage);
    mview.addObject("totalCount", totalCount);
    mview.setViewName("/lookbook/lookbookform");
    return mview;
  }

  @PostMapping("/lookbook/insert")
  public String insert(@ModelAttribute LookbookDto dto, HttpSession session,
      ArrayList<MultipartFile> upload) {
    // 업로드 경로 구하기
    String path = session.getServletContext().getRealPath("/photo");
    System.out.println(path);

    // 사진명 구해서 넣기
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

    String photoname = "";
    for (MultipartFile mf : upload) {
      String pname = "f" + sdf.format(new Date()) + "_" + mf.getOriginalFilename();
      photoname += pname + ",";

      // 실제 업로드
      try {
        mf.transferTo(new File(path + "\\" + pname));
      } catch (IllegalStateException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }
    photoname = photoname.substring(0, photoname.length() - 1);
    dto.setLook_photo(photoname);

    // insert
    service.insertLook(dto);

    // 목록으로 이동
    return "redirect:lookbookmain";
  }

  @GetMapping("/lookbook/details")
  public ModelAndView shopDetails(@RequestParam(defaultValue = "1") int currentPage,
      @RequestParam String num, @RequestParam(value = "look_id", required = false) String look_id,
      @RequestParam(required = false) String key) {
    ModelAndView mview = new ModelAndView();
    System.out.println("1:" + look_id);
    // 조회수 출력
    LookbookDto dto = service.getData(num);
    if (key != null)
      service.updateReadCount(num);


    // 최신글 하단에 출력
    int totalCount = service.getTotalCount();
    int start = 1;
    int end = 100;

    List<ProductDto> list = sservice.getAllLists(start, end);
    List<ProductOpDto> list2 = sservice.getAllOp();



    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("dto", dto);
    mview.addObject("list", list);
    mview.addObject("list2", list2);
    mview.addObject("currentPage", currentPage);
    mview.addObject("totalCount", totalCount);
    mview.setViewName("/lookbook/lookbookdetails");
    return mview;

  }

  @RequestMapping("/lookbook/idcheck")
  public @ResponseBody Map<String, Integer> LookidCheckProcess(@RequestParam String look_id) {
    // id 체크
    int count = 0;

    Map<String, Integer> map = new HashMap<String, Integer>();
    count = service.getLookIdCheck(look_id);
    map.put("cnt", count);// 0 or 1
    return map;
  }

  @GetMapping("/lookbook/lookbooklist")
  public String list(Model model) {
    List<LookbookDto> list = mapper.getAllLists(null);
    model.addAttribute("count", list.size());
    model.addAttribute("list", list);

    return "/lookbook/lookbooklist";
  }

}
