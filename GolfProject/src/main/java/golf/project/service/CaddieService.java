package golf.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.CaddieDao;
import golf.project.dto.CaddieDto;

@Service
public class CaddieService {

	@Autowired
	CaddieDao dao;
	
	public List<CaddieDto> Caddielist(){
		return dao.Caddielist();
	}
	
	public int insertCaddie(CaddieDto dto) {
		return dao.insertCaddie(dto);
	}
	
	public int updatestate(int cadno, int state) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cadno", cadno);
		map.put("state", state);
		return dao.updatestate(map);
	}
	
	public int deleteCaddie(int cartno) {
		return dao.deleteCaddie(cartno);
	}
	
	public List<CaddieDto> waitCaddie(){
		return dao.waitCaddie();
	}
	
	public int assignstate(int cadno) {
		return dao.assignstate(cadno);
	}
}
