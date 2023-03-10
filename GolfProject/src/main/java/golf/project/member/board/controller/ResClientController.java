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
        System.out.println("course????????? ?????????:"+course);
        
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

    //????????????
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
    
    // ????????????????????? ??????
 	@GetMapping("/kakaopay")
 	public @ResponseBody ReadyResponse payReady(@RequestParam(name = "price") int totalAmount, ResDto res, Model model) {
 		
 		log.info("????????????:"+res);
 		log.info("????????????:"+totalAmount);
 		// ????????? ?????? ????????????	- ???????????? service ??????.
 		ReadyResponse readyResponse = kakaoservice.payReady(totalAmount);
 		// ??????????????? ????????? ???????????? ??????(tid)??? ????????? ??????
 		model.addAttribute("tid", readyResponse.getTid());
 		log.info("???????????? ??????: " + readyResponse.getTid());		
 		// Order????????? ????????? ??????
 		model.addAttribute("res",res);
 		
 		return readyResponse; // ?????????????????? ??????.(tid,next_redirect_pc_url??? ????????????.)
 	}
 	
 	     // ??????????????????
 		@GetMapping("/kakaopay/complete")
 		public String payCompleted(@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, @ModelAttribute("res") ResDto res,  Model model) {
 			
 			log.info("???????????? ????????? ???????????? ??????: " + pgToken);
 			log.info("????????????: " + res);		
 			log.info("???????????? ??????: " + tid);
 			
 			// ????????? ?????? ????????????
 			ApproveResponse approveResponse = kakaoservice.payApprove(tid, pgToken);	
 
 			SalesDto result = SalesDto.builder() 
 					.resnum(res.getResnum())
 					.paydate(res.getResdate())
 					.price(res.getPrice())
 					.id(res.getId())
 					.course(res.getRescourse())
 					.usetime(res.getRestime())
 					.build();
 			
 			kakaoservice.insertSales(result); //res??? resnum??? ?????? ?????? ???????????????, pay_status??? resnum??? res??? ???????????? ???????????? ??????
 			
 			return "redirect:/reservation";
 		}
 		
 		
 	// ?????? ????????? ?????? url
 		@GetMapping("/kakaopay/cancel")
 		public String payCancel() {
 			return "redirect:/reservation";
 		}
 	    
 		// ?????? ????????? ?????? url    	
 		@GetMapping("/kakaopay/fail")
 		public String payFail() {
 			return "redirect:/reservation";
 		}

    private int generateResNum() {
        return (int) (Math.random() * 1000000);
    }

}