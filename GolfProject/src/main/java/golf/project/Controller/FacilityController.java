package golf.project.Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import golf.project.dto.QuestionDto;
import golf.project.dto.ResultDto;
import golf.project.service.FacilityService;

@Controller
public class FacilityController {

	@Autowired
	FacilityService service;
	
	@GetMapping("/admin/facility")
	public String openfacility() {
		return "/admin/FacilityManage";
	}
	
	@GetMapping("/admin/facilityResult")
	public String openResult() {
		return "/admin/FacilityResult";
	}
	
	@PostMapping("/admin/facilityResult")
	@ResponseBody
	public String Result(String start, String end, int category) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		List<Map<String,Object>> mlist=service.resultlist(map);
		Gson gson = new Gson();
		return gson.toJson(mlist);
	}
	
	@GetMapping("/admin/nullResult")
	@ResponseBody
	public String nullResult(String start, String end, int category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		List<Map<String,Object>> nlist=service.countnull(map);
		Gson gson = new Gson();
		return gson.toJson(nlist);
	}
	
	@GetMapping("/admin/facility/pop")
	@ResponseBody
	public String course(int value) {
		List<QuestionDto> clist = service.categoryselc(value);
		Gson gson = new Gson();
		return gson.toJson(clist);
	}
	
	@PostMapping("/admin/save")
	@ResponseBody
	public String save(String[] dataarray) {
		
		String i="";
		for (String ary : dataarray) {
			i = i + ary;
			}
		
		String[] s = i.split("\\]");
		
		String ary1 = s[0].replaceAll("\\[", "");
		String ary2 = ary1.replaceAll("\\]", "");
		String ary3 = ary2.replaceAll("\"", " ");
		String[] numary = ary3.split("  ");
		String[] num = new String[5];
		for(int k=0; k<numary.length; k++) {
			num[k] = numary[k].trim();
		}
		
		String ary4 = s[1].replaceAll("\\[", "");
		String ary5 = ary4.replaceAll("\\]", "");
		String nullchange = ary5.replace("null", "\"0\"");  //null??? ?????? ""??? ???????????? ??????
		String ary6 = nullchange.replaceAll("\"", " ");
		String[] resultary = ary6.split("  ");
		String[] result = new String[5];
		for(int k=0; k<resultary.length; k++) {
			result[k] = resultary[k].trim();
		}
		
		String ary7 = s[2].replaceAll("\\[", "");
		String ary8 = ary7.replaceAll("\\]", "");
		String ary9 = ary8.replaceAll("\"", " ");
		String[] remarkary = ary9.split("  ");
		String[] remark = new String[5];
		for(int k=0; k<remarkary.length; k++) {
			remark[k] = remarkary[k].trim();
		}
		
		String ary10 = s[3].replaceAll("\\[", "");
		String ary11 = ary10.replaceAll("\\]", "");
		String category = ary11.replaceAll("\"", "");
		
		Map<String,Object> m1 = new HashMap<String,Object>();
		Map<String,Object> m2 = new HashMap<String,Object>();
		Map<String,Object> m3 = new HashMap<String,Object>();
		Map<String,Object> m4 = new HashMap<String,Object>();
		Map<String,Object> m5 = new HashMap<String,Object>();

		m1.put("num", num[0]);
		m1.put("result", result[0]);
		m1.put("remark", remark[0]);
		m1.put("category", category.charAt(0));
		
		m2.put("num", num[1]);
		m2.put("result", result[1]);
		m2.put("remark", remark[1]);
		m2.put("category", category.charAt(0));
		
		m3.put("num", num[2]);
		m3.put("result", result[2]);
		m3.put("remark", remark[2]);
		m3.put("category", category.charAt(0));
		
		m4.put("num", num[3]);
		m4.put("result", result[3]);
		m4.put("remark", remark[3]);
		m4.put("category", category.charAt(0));
		
		m5.put("num", num[4]);
		m5.put("result", result[4]);
		m5.put("remark", remark[4]);
		m5.put("category", category.charAt(0));
		
		
		System.out.println(nullchange);
		service.savedata(m1);
		service.savedata(m2);
		service.savedata(m3);
		service.savedata(m4);
		service.savedata(m5);

		return "";
	}
	
	@GetMapping("/admin/downloadexcel")
	public void excel(HttpServletResponse response, String startdate, String enddate, Integer category) {
		
		//??????????????????------------------------------------------------
				String fileName = "";
				try {
					fileName = new String("?????????.xlsx".getBytes("utf-8"), "iso-8859-1");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				response.setContentType("ms-vnd/excel");

				//response.setContentType("application/octet-stream; charset=utf-8");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		        //---------------------------------------------------------
				System.out.println("startdate="+startdate+",enddate="+enddate+"category="+category);
				
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("start", startdate);
				map.put("end", enddate);
				map.put("category", category);
				List<ResultDto> rlist = service.exceldownload(map);


				
				Workbook workbook = new SXSSFWorkbook(); //excel?????? ??????

				Sheet sheet = workbook.createSheet("????????? ??????");
				Row row = null;
				Cell cell = null;
				int rowNum = 0;

				// Header
				row = sheet.createRow(rowNum++); //????????????(?????????)
				cell = row.createCell(0); //0?????? ?????????(?????????)
				cell.setCellValue("????????????"); // 0?????? ?????? id value set
				cell = row.createCell(1);
				cell.setCellValue("????????????");
				cell = row.createCell(2);
				cell.setCellValue("??????");
				cell = row.createCell(3);
				cell.setCellValue("??????");
				cell = row.createCell(4);
				cell.setCellValue("??????");

				// Body, db?????? ??? ????????? ????????? ??????
				for (int i = 0; i < rlist.size(); i++) {
					row = sheet.createRow(rowNum++);
					ResultDto r = rlist.get(i);
					cell = row.createCell(0);
					cell.setCellValue(format(r.getQuedate()));
					cell = row.createCell(1);
					cell.setCellValue(r.getCategory());
					cell = row.createCell(2);
					cell.setCellValue(r.getNum());
					cell = row.createCell(3);
					cell.setCellValue(r.getResultcheck());
					cell = row.createCell(4);
					cell.setCellValue(r.getRemark());
				}

				// Excel File Output
				try {
					workbook.write(response.getOutputStream());
					workbook.close(); //excel????????? response??? ??????, ????????? ????????? ?????? ????????? ???????????? ????????????????????? reponse ??????
				} catch (IOException e) {
					e.printStackTrace();
				}
	}
	
	private static String format(Date d) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(d);
	}
}
