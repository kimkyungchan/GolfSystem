package golf.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ResultDto {

	private int no;
	private int category;
	private int num;
	private Date quedate;
	private int resultcheck;
	private String remark;
}