package golf.project.member.board.controller;

import golf.project.dto.ResDto;
import golf.project.dto.ResSelDto;
import golf.project.dto.SalesDto;
import golf.project.kakaopay.ApproveResponse;
import golf.project.kakaopay.ReadyResponse;
import golf.project.member.board.LoginManager;
import golf.project.member.board.dto.MemDto;
import golf.project.member.board.dto.ResClientDto;
import golf.project.member.board.service.MemService;
import golf.project.member.board.service.ResClientService;
import golf.project.service.AdminResSelService;
import golf.project.service.KakaopayService;
import golf.project.service.ResSelService;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@Slf4j
@SessionAttributes({"user","tid","res"})
public class ResClientController {
    @Autowired
    ResClientService service;

    @Autowired
    MemService memService;
    
    @Autowired
    KakaopayService kakaoservice;
    
    @Autowired
    ResSelService resservice;
    
    @Autowired
    AdminResSelService resselser; 

    @ModelAttribute("user")
    public MemDto getDto() {
        return new MemDto();
    }

    @GetMapping("/reservation")
    public String getReservationForm() {
        return "reservation/form";
    }

    @PostMapping("/reservation/submit")
    public String handleReservation(
            @RequestBody MultiValueMap<String, String> body,
            HttpServletRequest request
    ) throws ParseException {
        String memberId = LoginManager.getLoginMemberIdOrFail(request);
        MemDto member = memService.findMember(memberId);

        ResClientDto dto = new ResClientDto();
        dto.setResNum(generateResNum());
        dto.setName(member.getName());
        dto.setResDate(new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(body.getFirst("date")));
        dto.setResCourse(body.getFirst("course"));
        dto.setRestime(body.getFirst("time"));
        dto.setID(member.getId());
        dto.setCancelled(false);
        dto.setPrice(Integer.parseInt(body.getFirst("price")));
        dto.setNumPerson(Integer.parseInt(body.getFirst("num_person")));
        
        String course = dto.getResCourse().substring(0, 1);
        System.out.println("course테스트 입니다:"+course);
        
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("ResDate", dto.getResDate());
        map.put("restime", dto.getRestime());
        map.put("course", course);
        
        service.insertRes(dto);
        resselser.deletesel(map);
        

        return "redirect:/reservation";
    }

    @PostMapping("/reservation/cancel")
    public String cancelReservation(
            @RequestBody MultiValueMap<String, String> body,
            HttpServletRequest request
    ) {
        LoginManager.getLoginMemberIdOrFail(request);

        String resNum = body.getFirst("res_num");
        service.cancel(resNum);

        return "redirect:/me/reservations";
    }

    @GetMapping("/me/reservations")
    public String getMyReservations(HttpServletRequest request, Model model) {
        String memberId = LoginManager.getLoginMemberIdOrFail(request);
        MemDto member = memService.findMember(memberId);

        List<ResClientDto> reservations = service.getMemberReservations(memberId);

        model.addAttribute("reservations", reservations);
        model.addAttribute("member", member);

        return "mem/my-reservations";
    }

    //결제하기
    @GetMapping("/me/ready-reservations")
    public String getMyReadyReservations(HttpServletRequest request, Model model) {
        String memberId = LoginManager.getLoginMemberIdOrFail(request);

        List<ResClientDto> reservations = service.getMemberReadyReservations(memberId);

        model.addAttribute("reservations", reservations);

        return "mem/my-ready-reservations";
    }
    
    @GetMapping("selres")
    @ResponseBody
    public String selList(String seldate, Model m) {
       System.out.println(seldate);
       List<ResSelDto> listSel = resservice.selectRes(seldate);
       Gson gson = new Gson();
       return gson.toJson(listSel);
       
    
    }
    
    // 카카오페이결제 요청
 	@GetMapping("/kakaopay")
 	public @ResponseBody ReadyResponse payReady(@RequestParam(name = "price") int totalAmount, ResDto res, Model model) {
 		
 		log.info("주문정보:"+res);
 		log.info("주문가격:"+totalAmount);
 		// 카카오 결제 준비하기	- 결제요청 service 실행.
 		ReadyResponse readyResponse = kakaoservice.payReady(totalAmount);
 		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
 		model.addAttribute("tid", readyResponse.getTid());
 		log.info("결재고유 번호: " + readyResponse.getTid());		
 		// Order정보를 모델에 저장
 		model.addAttribute("res",res);
 		
 		return readyResponse; // 클라이언트에 보냄.(tid,next_redirect_pc_url이 담겨있음.)
 	}
 	
 	     // 결제승인요청
 		@GetMapping("/kakaopay/complete")
 		public String payCompleted(@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, @ModelAttribute("res") ResDto res,  Model model) {
 			
 			log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
 			log.info("주문정보: " + res);		
 			log.info("결재고유 번호: " + tid);
 			
 			// 카카오 결재 요청하기
 			ApproveResponse approveResponse = kakaoservice.payApprove(tid, pgToken);	
 
 			SalesDto result = SalesDto.builder() 
 					.resnum(res.getResnum())
 					.paydate(res.getResdate())
 					.price(res.getPrice())
 					.id(res.getId())
 					.course(res.getRescourse())
 					.usetime(res.getRestime())
 					.build();
 			
 			kakaoservice.insertSales(result); //res의 resnum과 같은 값을 입력해야함, pay_status의 resnum이 res의 외래키를 사용하기 때문
 			
 			return "redirect:/reservation";
 		}
 		
 		
 	// 결제 취소시 실행 url
 		@GetMapping("/kakaopay/cancel")
 		public String payCancel() {
 			return "redirect:/reservation";
 		}
 	    
 		// 결제 실패시 실행 url    	
 		@GetMapping("/kakaopay/fail")
 		public String payFail() {
 			return "redirect:/reservation";
 		}

    private int generateResNum() {
        return (int) (Math.random() * 1000000);
    }

}