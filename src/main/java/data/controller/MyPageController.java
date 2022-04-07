package data.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberDto;
import data.dto.OrderDetailDto;
import data.mapper.MyPageMapper;
import data.service.MyPageService;
import data.service.OrderService;

@Controller
public class MyPageController {

  @Autowired
  MyPageMapper mapper;
  @Autowired
  MyPageService service;
  @Autowired
  OrderService o_service;


  @GetMapping("/mypage/main")
  public ModelAndView mpMain(@RequestParam(value = "id", required = false) String id) {
    ModelAndView mview = new ModelAndView();
    MemberDto dto = service.getUser(id);
    System.out.println("1" + id);


    mview.addObject("dto", dto);
    mview.setViewName("/userpage/mypage");
    return mview;
  }

  @GetMapping("/mypage/updateform")
  public ModelAndView mpUpdateForm(@RequestParam String id, HttpSession session) {
    ModelAndView mview = new ModelAndView();
    MemberDto dto = service.getUser(id);
    session.setAttribute("id", id);
    String[] em = dto.getEmail().split("@");
    String[] pn = dto.getHp().split("-");
    dto.setEmail1(em[0]);
    dto.setEmail2(em[1]);
    dto.setHp2(pn[1]);
    dto.setHp3(pn[2]);
    System.out.println("2" + id);


    mview.addObject("dto", dto);
    mview.setViewName("/userpage/updateform");
    return mview;
  }

  @GetMapping("/mypage/orderlist")
  public ModelAndView mpOrderList(@RequestParam String id, HttpSession session) {
    int no = +1;
    String userid = (String) session.getAttribute("myid");
    ModelAndView mview = new ModelAndView();
    MemberDto dto = service.getUser(id);
    List<OrderDetailDto> orderlist = o_service.orderList(userid);
    mview.addObject("orderlist", orderlist);
    mview.addObject("dto", dto);
    mview.addObject("no", no);
    mview.setViewName("/userpage/orderlist");
    return mview;
  }

  @PostMapping("/mypage/update")
  public String update(@ModelAttribute MemberDto dto, HttpSession session) {
    dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
    dto.setHp(dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3());
    String id = (String) session.getAttribute("id");


    service.updateMember(dto);
    return "redirect:/mypage/main?id=" + id;

  }

  @GetMapping("/mypage/updatepassform")
  public String updatePassForm(@RequestParam String id, Model model) {
    model.addAttribute("id", id);
    return "/userpage/updatepassform";

  }



  @PostMapping("/mypage/updatepass")
  public String updatePass(@RequestParam String id, @RequestParam String pass) {
    // db로부터 비번이 맞는지 체크
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("id", id);
    map.put("pass", pass);

    int check = mapper.passEqual(map);
    if (check == 1) {// 비번이 맞는경우
      return "redirect:updateform?id=" + id;
    } else {// 틀린경우
      return "/userpage/updatepassfail";
    }

  }

  @GetMapping("/mypage/deletepassform")
  public String deletePassForm(@RequestParam String id, Model model) {
    model.addAttribute("id", id);
    return "/userpage/deletepassform";

  }

  @PostMapping("/mypage/deletepass")
  public String deletePass(@RequestParam String id, @RequestParam String pass) {
    // db로부터 비번이 맞는지 체크
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("id", id);
    map.put("pass", pass);

    int check = mapper.passEqual(map);
    if (check == 1) {// 비번이 맞는경우
      return "redirect:delete?id=" + id + "&pass=" + pass;
    } else {// 틀린경우
      return "/userpage/updatepassfail";
    }

  }

  @GetMapping("/mypage/deletesuccess")
  public String deletesuc() {
    return "/userpage/deletesuccess";
  }

  @GetMapping("/mypage/delete")
  public String delete(@RequestParam String id, @RequestParam String pass, HttpSession session) {
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("id", id);
    map.put("pass", pass);

    service.deleteUser(id, pass);

    session.invalidate();
    return "redirect:deletesuccess";
  }



}


