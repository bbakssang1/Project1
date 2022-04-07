package data.service;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.mapper.MyPageMapper;

@Service
public class MyPageService {


  @Autowired
  MyPageMapper mapper;

  public MemberDto getUser(String id) {
    return mapper.getUser(id);
  }

  public MemberDto getUpdate(String id) {
    return mapper.getUpdate(id);
  }

  public MemberDto getOrderList(String id) {
    return mapper.getOrderList(id);
  }

  public void updateMember(MemberDto dto) {
    mapper.updateMember(dto);
  }

  public void deleteUser(String id, String pass) {
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("id", id);
    map.put("pass", pass);

    mapper.deleteUser(map);
  }
}
