package golf.project.member.board.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ResClientDto {
	private int ResNum;
    private String Name;
    private Date ResDate;
    private String ResCourse;
    private String restime;
    private String ID;
    private boolean Cancelled;
    private int Price;

    private int NumPerson;

    public String getFormattedDate() {
        return new SimpleDateFormat("yyyy-MM-dd").format(getResDate());
    }

}
