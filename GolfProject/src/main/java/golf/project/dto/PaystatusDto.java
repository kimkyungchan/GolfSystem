package golf.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PaystatusDto {

	private int ResNum;
	private Date Paydate;
	private int Price;
	private String ID;
	private String UseTime;
	private String Course;
	
}
