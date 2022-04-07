package data.mapper;

import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberDto;

@Mapper
public interface MyPageMapper {
  public MemberDto getUser(String id);

  public MemberDto getUpdate(String id);

  public MemberDto getOrderList(String id);

  public void updateMember(MemberDto dto);

  public int passEqual(HashMap<String, String> map);

  public void deleteUser(HashMap<String, String> map);
}
