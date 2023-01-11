package golf.project.member.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
	private int no;
	private String admin_id;
	private String title;
	private String content;
	private Date writedate;
	private int readcount;

}
