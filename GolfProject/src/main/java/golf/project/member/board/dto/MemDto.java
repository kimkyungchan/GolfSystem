package golf.project.member.board.dto;



import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;



import lombok.Data;

@Data
public class MemDto {
	
	@NotNull(message="id is null.")
	@NotEmpty(message="id is empty.")
	private String id;
	@NotNull(message="password is null.")
	@NotEmpty(message="password is empty.")
	private String  password;
	private String  password_check;
	private String name;
	private String email;
	private String phone; 
	private String address;
	
}