package golf.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AdminJoinBoardDto {
	
	private String id;
	private int no;
	private String subject;
	private Date regdate;
	private int readcount;
	private String content;
	

}
