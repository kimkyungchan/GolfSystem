package golf.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AdminRefBoardDto {
	
	private String id;
	private int no;
	private String subject;
	private String content;
	private Date regdate;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
}
