package data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.dto.CartDto;
import data.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService service;
	
	//카트 담기
	@RequestMapping("/shop/addcart")
	public @ResponseBody int addCart(@ModelAttribute CartDto cdto,
									HttpSession session) {
		int result = 0;
		String member = (String)session.getAttribute("myid");
		System.out.println(member);
		if(member != null) {
			cdto.setUserid(member);
			service.addCart(cdto);
			result = 1;
		}
		return result;
	}
	
	//카트 목록
	@GetMapping("/shop/cart")
	public String cartList(HttpSession session,Model model) {
		String userid = (String)session.getAttribute("myid");
		List<CartDto> cartlist = service.cartList(userid);
		List<CartDto> totalpriceandcnt = service.totalPriceAndCnt(userid);
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("totalpriceandcnt", totalpriceandcnt);
		return "/shop/shopcart";
	}
	
	// 카트 삭제
	@ResponseBody
	@PostMapping("/shop/deletecart")
	public int deleteCart(HttpSession session,
							@RequestParam(value = "chbox[]") List<String> chArr, CartDto cdto) {
		String member = (String)session.getAttribute("myid");
		int result = 0;
		int c_idx = 0;
		if(member != null) {
			cdto.setUserid(member);
			for(String i : chArr) {
				c_idx = Integer.parseInt(i);
				cdto.setC_idx(c_idx);
				service.deleteCart(cdto);
			}
			result = 1;
		}
		return result;  
	}
	
	@GetMapping("/shop/order")
	
	public String orderPage(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("myid");
		List<CartDto> cartlist = service.cartList(userid);
		CartDto order = service.orderList(userid);
		String []em = order.getM_email().split("@");
		order.setM_email1(em[0]);
		order.setM_email2(em[1]);
		String []hp = order.getM_hp().split("-");
		order.setM_hp1(hp[0]);
		order.setM_hp2(hp[1]);
		order.setM_hp3(hp[2]);
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("order", order);
		return "/shop/cartorder";
	}
}
