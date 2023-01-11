package golf.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdminResSelDto {
	
	private int no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date seldate;
	private String selcourse;
	private String seltime;
	private int selpct;
	private int selprice;
	private int state;

}
