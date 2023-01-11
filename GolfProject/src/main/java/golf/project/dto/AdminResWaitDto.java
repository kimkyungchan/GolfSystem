package golf.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdminResWaitDto {

	private Date signupdate;
	private String id;
	@DateTimeFormat(pattern = "yy. MM. dd")
	private Date hopeday;
	private String hopecourse;
	private String hopetime;
	private Date resdate;
	private String rescourse;
	private String restime;
	
}
