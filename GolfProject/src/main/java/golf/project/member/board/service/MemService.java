package golf.project.member.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.member.board.dao.MemCilentDao;
import golf.project.member.board.dto.MemDto;

@Service("mem2Service")
public class MemService {
	@Autowired
	MemCilentDao dao;
	
	public String idCheck(String id) {
		return dao.idCheck(id);
	}
	public int insertMem(MemDto dto) {
		return dao.insertMem(dto);
	}
	public MemDto login(MemDto dto) {
		return dao.login(dto);
	}

    public MemDto findMember(String id) {
        return dao.findMemberById(id);
    }

	public int updateMem(MemDto dto) {
		return dao.updateMem(dto);
	}
	public int deleteMem(String formpw, MemDto dto ) {
		String pw = dto.getPassword();
		if(pw.equals(formpw)) {
			return dao.deleteMem(dto.getId());
		}else {
			return 0;
		}
	}
	public List<MemDto> memsInfo(){
		return dao.memsInfo();
	}
	public MemDto selid(Map<String,Object> map) {
		return dao.selid(map);
	}
	
	public int updatepass(Map<String,Object> map) {
		return dao.updatepass(map);
	}
}
