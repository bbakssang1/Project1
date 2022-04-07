package data.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.OrderDetailDto;
import data.dto.OrderDto;

@Mapper
public interface OrderMapper {

  public void orderInsert(OrderDto odto);

  public void orderDetailInsert(HashMap<String, String> map);

  public void cartAllDelete(String userid);

  public List<OrderDetailDto> orderList(String orderer);
}
