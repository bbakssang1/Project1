package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CartDto;
import data.dto.ProductDto;

@Mapper
public interface CartMapper {
	public void addCart(CartDto cdto);
	public List<CartDto> cartList(String userid);
	public List<CartDto> totalPriceAndCnt(String userid);
	public void deleteCart(CartDto cdto);
	public CartDto orderList(String userid);
}
