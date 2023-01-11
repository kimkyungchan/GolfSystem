package golf.project.member.board.controller;

import golf.project.member.board.LoginManager;
import golf.project.member.board.dto.EmailVo;
import golf.project.member.board.dto.MemDto;
import golf.project.member.board.service.EmailService;
import golf.project.member.board.service.MemService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller("mem2Controller")
@SessionAttributes("user")
public class MemController {
    @Autowired
    MemService service;
    
    @Autowired
    EmailService emailservice;

    @ModelAttribute("user")
    public MemDto getDto(HttpServletRequest request) {
        String memberId = LoginManager.getLoginMemberIdOrFail(request);
        return service.findMember(memberId);
    }

    @GetMapping("/insert")
    public String joinform() {
        return "mem/joinform";
    }

    @GetMapping("/idCheck")
    @ResponseBody
    public String idCheck(String id) {
        String checkid = service.idCheck(id);
        return checkid;
    }

    @PostMapping("/insert")
    public String insert(MemDto dto) {
        System.out.println("test");
        service.insertMem(dto);
        return "redirect:loginform";
    }

    @GetMapping("/loginform")
    public String loginform() {
        return "mem/loginform";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("command") @Valid MemDto dto, BindingResult error, Model m, HttpServletResponse response) {
        if (error.hasErrors()) {
            return "mem/loginform";
        }

        MemDto resultDto = service.login(dto);
        if (resultDto == null) {
            error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");
            return "mem/loginform";
        } else {// 로그인 성공
            m.addAttribute("user", resultDto);

            LoginManager.login(response, resultDto.getId());
        }
        return "redirect:/main";
    }

    @GetMapping("/logout")
    public String logout(HttpServletResponse response, SessionStatus status) {
        status.setComplete();
        LoginManager.logout(response);
        return "redirect:/";
    }

    @GetMapping("/updateform")
    public String updateform(@ModelAttribute("user") MemDto dto) {
        return "mem/updateform";
    }

    @PutMapping("/update")
    public String update(MemDto dto, SessionStatus status) {
        //System.out.println(dto);
        service.updateMem(dto);
        status.setComplete();

        return "redirect:/main";
    }

    @GetMapping("/deleteform")
    public String deleteform(String result, Model m) {
        m.addAttribute("result", result);
        return "mem/deleteform";
    }

    @PostMapping("/delete")
    public String delete(HttpServletResponse response, String pword, @ModelAttribute("user") MemDto dto, SessionStatus status) {
        int i = service.deleteMem(pword, dto);
        if (i == 0) {
            return "redirect:/deleteform?result=false";
        } else {
            LoginManager.logout(response);
            status.setComplete();
        //    return "redirect:/";
            return "mem/deletealert";
            }
    }
    
    @GetMapping("/searchid")
    public String searchid() {
    	return "mem/searchid";
    }
    
    @PostMapping("/searchid")
    public String searchid(String name,String phone, Model m) {
    	Map<String,Object> map = new HashMap<String,Object>();
    	map.put("phone", phone);
    	map.put("name", name);
    	MemDto searchid = service.selid(map);
    	m.addAttribute("search", searchid);
    	
    	return "mem/idresult";
    }
    
    @GetMapping("/searchpass")
    public String searchpass() {
    	return "mem/searchpass";
    }
    
    @RequestMapping("/send")
    @ResponseBody
	public String[] sendEmail(String emailadd) throws Exception {
		EmailVo email = new EmailVo();
		
		String receiver = emailadd; // Receiver.
		String subject = "비밀번호 찾기 인증번호";
		String number = makeRandom();
		String content = "인증 번호는 "+number+"입니다.";
		
		email.setSubject(subject);
		email.setContent(content);
		email.setReceiver(receiver);
		
		Boolean result = emailservice.sendMail(email);
		
		return new String[] {number, result.toString()};
	}
    
	private String makeRandom() {
		Random r= new Random();
		String number="";
		
		for(int i = 0;i < 6; i++) {
			number += r.nextInt(10);
		}
		System.out.println("number :"+number);
		return number;
	}
	
	@GetMapping("/newpass")
	public String newpass(String id, Model m) {
		m.addAttribute("id", id);
		return "mem/newpass";
	}
	
	@PostMapping("/newpass")
	public String updatepass(String password, String ckpassword, String id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("password", password);
		map.put("id", id);
		service.updatepass(map);
		return "redirect:/loginform";
	}
	

    @RequestMapping("/main")
    public String main(@ModelAttribute("user") MemDto dto) {
        if (dto.getId() != null) {
            return "mem/main";
        } else {
            return "mem/loginform";
        }
    }


    @GetMapping("/other/food")
    public String others() {
        return "other/food";
    }

    @GetMapping("/other/cu")
    public String others1() {
        return "other/cu";
    }

    @GetMapping("/other/course")
    public String others2() {
        return "other/course";
    }

    @GetMapping("/other/location")
    public String others3() {
        return "other/location";
    }

    @GetMapping("/other/weather")
    public String others4() {
        return "other/weather";
    }
    
}
