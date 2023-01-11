package golf.project.member.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.member.board.dto.NoticeDto;

@Mapper
public interface NoticeCilentDao {
    

    List<NoticeDto> noticeList(Map<String, Object> m); //여러줄가져오므로 list
	int count(); //전체 글 갯수
	NoticeDto noticeOne(int no);
	int addReadcount(int no);
	int countSearch(Map<String, Object> m);
	List<NoticeDto> noticeListSearch(Map<String, Object> m);
	
}