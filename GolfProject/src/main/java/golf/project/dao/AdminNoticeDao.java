package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.AdminNoticeDto;

@Mapper
public interface AdminNoticeDao {
	
	int insert(AdminNoticeDto dto); 	
	int count();
	List<AdminNoticeDto> noticeList(Map<String, Object> m);
	int updateNotice(AdminNoticeDto dto);
	int deleteNotice(int no);
	AdminNoticeDto noticeOne(int no);
	
	int addReadcount(int no);
	
	List<AdminNoticeDto> noticeListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);
	

}
