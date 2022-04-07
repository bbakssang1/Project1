package data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.LookbookDto;
import data.mapper.LookMapper;

@Service
public class LookService {

	@Autowired
	LookMapper mapper;
	
	public void insertLook(LookbookDto dto) {
		mapper.insertLook(dto);
	}
	
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
	
	public LookbookDto getData(String num) {
		return mapper.getData(num);
	}
	
	public void updateReadCount(String num) {
		mapper.updateReadCount(num);
	}
	
	public List<LookbookDto> getAllLists(int start, int perpage) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.getAllLists(map);
	}
	
	public int getLookIdCheck(String look_id) {
		return mapper.getLookIdCheck(look_id);
	}
}
