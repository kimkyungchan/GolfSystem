package golf.project.member.board.service;

import golf.project.member.board.dao.ResClientDao;
import golf.project.member.board.dto.ResClientDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("res2Service")
public class ResClientService {

    @Autowired
    ResClientDao dao;

    public int insertRes(ResClientDto dto) {
        return dao.insert(dto);
    }

    public List<ResClientDto> getMemberReservations(String memberId) {
        return dao.getMemberReservations(memberId);
    }

    public List<ResClientDto> getMemberReadyReservations(String memberId) {
        return dao.getMemberReadyReservations(memberId);
    }

    public int cancel(String resNum) {
        return dao.cancel(resNum);
    }

}
