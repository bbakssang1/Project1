package data.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import data.dto.OrderDetailDto;
import data.dto.OrderDto;
import data.mapper.OrderMapper;

@Service
public class OrderService {
  @Autowired
  OrderMapper mapper;

  public void orderInsert(OrderDto odto) {
    mapper.orderInsert(odto);
  }

  public void orderDetailInsert(String order_id, String userid) {
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("order_id", order_id);
    map.put("userid", userid);

    mapper.orderDetailInsert(map);
  }

  public void cartAllDelete(String userid) {
    mapper.cartAllDelete(userid);
  }

  public List<OrderDetailDto> orderList(String orderer) {
    return mapper.orderList(orderer);
  }
}
