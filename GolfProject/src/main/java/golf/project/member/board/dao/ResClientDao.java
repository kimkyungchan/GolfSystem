package golf.project.member.board.dao;

import golf.project.member.board.dto.ResClientDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ResClientDao {

    @Insert("insert into res (resnum, name, resdate, rescourse, restime, id, cancelled, price, numperson) values(#{ResNum}, #{Name}, #{ResDate}, #{ResCourse}, #{restime}, #{ID}, #{Cancelled}, #{Price}, #{NumPerson})")
    int insert(ResClientDto dto);

    @Update("update res set cancelled=1 where resnum=#{resNum}")
    int cancel(String resNum);

    @Select("select res.* from res left join pay_status ps on res.ResNum = ps.ResNum where res.Cancelled = 0 and res.ID = #{memberId} and ps.ResNum is null")
    List<ResClientDto> getMemberReadyReservations(String memberId);

    @Select("select * from res where id=#{memberId} and cancelled = 0 order by ResDate, restime")
    List<ResClientDto> getMemberReservations(String memberId);

}
