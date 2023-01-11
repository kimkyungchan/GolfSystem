package golf.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SalesDto {
	
	private int resnum;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paydate;
	private int price;
	private String id;
	private String course;
	private String usetime;
	
}
