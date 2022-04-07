package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.CartDto;
import data.dto.ProductDto;
import data.mapper.CartMapper;

@Service
public class CartService {
	
	@Autowired
	CartMapper mapper;
	
	public void addCart(CartDto cdto) {
		mapper.addCart(cdto);
	}
	
	public List<CartDto> cartList(String userid){
		return mapper.cartList(userid);
	}
	
	public List<CartDto> totalPriceAndCnt(String userid){
		return mapper.totalPriceAndCnt(userid);
	}
	
	public void deleteCart(CartDto cdto) {
		mapper.deleteCart(cdto);
	}
	
	public CartDto orderList(String userid){
		return mapper.orderList(userid);
	}
}