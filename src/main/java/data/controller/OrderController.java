package data.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import data.dto.CartDto;
import data.dto.OrderDetailDto;
import data.dto.OrderDto;
import data.service.OrderService;

@Controller
public class OrderController {
  @Autowired
  OrderService service;

  // 주문
  @PostMapping("/shop/orderinsert")
  public String order(HttpSession session, @ModelAttribute OrderDto odto,
      @ModelAttribute OrderDetailDto oddto, @ModelAttribute CartDto cdto) {
    String orderer = (String) session.getAttribute("myid");

    // 이메일 형식으로 넣어주기
    odto.setO_email(odto.getO_email1() + "@" + odto.getO_email2());
    // 핸드폰 번호 넣기
    odto.setO_hp(odto.getO_hp1() + "-" + odto.getO_hp2() + "-" + odto.getO_hp3());

    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
    String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
    String subNum = "";

    for (int i = 1; i <= 6; i++) {
      subNum += (int) (Math.random() * 10);
    }

    String order_id = ymd + "_" + subNum;

    odto.setOrder_id(order_id);
    odto.setOrderer(orderer);

    service.orderInsert(odto);

    oddto.setOrder_id(order_id);
    service.orderDetailInsert(order_id, orderer);

    service.cartAllDelete(orderer);

    return "redirect:/shop/ordersuccess";
  }

  // 주문 목록
  @GetMapping("/shop/ordersuccess")
  public ModelAndView getOrderList(HttpSession session) {
    String userid = (String) session.getAttribute("myid");
    ModelAndView mview = new ModelAndView();
    mview.addObject(userid);
    mview.setViewName("/shop/ordersuccess");
    return mview;
  }
}
