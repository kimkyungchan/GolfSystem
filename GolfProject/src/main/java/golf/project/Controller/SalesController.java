package golf.project.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import golf.project.dto.SalesDto;
import golf.project.service.SalesService;

@Controller
public class SalesController {

	@Autowired
	SalesService service;
	
	@GetMapping("/admin/SalesManage")
	public String SalesManageOpen() {
		return "admin/SalesManage";
	}
	
	@PostMapping("/admin/SalesManage")
	@ResponseBody
	public String selSales(String start, String end) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		List<SalesDto> slist = service.selSales(map);
		Gson gson = new Gson();
		return gson.toJson(slist);
	}
	
}
