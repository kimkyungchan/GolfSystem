package golf.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AdminResDto {
	
	private int resnum;
	private String name;
	private Date resdate;
	private String rescourse;
	private String restime;
	private int numperson;
	private int caddie;
	private int cart;
	private int price;

}
