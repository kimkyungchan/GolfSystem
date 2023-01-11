package golf.project.dto;

import java.util.Date;


import lombok.Data;

@Data
public class AdminNoticeDto {
	
	private String Admin_ID;
	private int no;
	private String title;
	private String content;
	private Date writedate;
	private int readcount;
	

}
