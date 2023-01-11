package golf.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ResDto {
	
	private int resnum;
	private String name;
	private Date resdate;
	private String rescourse;
	private String restime;
	private String id;
	private int cancelled;
	int numperson;
	int price;
	int caddie;
	int cart;

}
