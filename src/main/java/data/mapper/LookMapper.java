package data.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.LookbookDto;

@Mapper
public interface LookMapper {
	public void insertLook(LookbookDto dto);
	
	public int getTotalCount();
	
	public List<LookbookDto> getAllLists(HashMap<String, Integer> map);
	
	public LookbookDto getData(String num);
	
	public void updateReadCount(String num);
	
	public int getLookIdCheck(String look_id);
}
