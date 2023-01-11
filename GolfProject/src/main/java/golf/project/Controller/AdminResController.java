package golf.project.Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import golf.project.dto.AdminResDto;
import golf.project.service.AdminResService;

@Controller
public class AdminResController {
	@Autowired
	AdminResService service;
	
	@RequestMapping("/adminRes/list")
	public String list(Model m) {
		int count = service.count();
		if(count > 0) {						
			List<AdminResDto> adminResList = service.adminResList();			
			m.addAttribute("aRList", adminResList);						
		}m.addAttribute("count", count);
		return "adminRes/list";
	}
	
	@DeleteMapping("/adminRes/delete")
	@ResponseBody
	public String resdelete(int resnum) {
		int i = service.deleteres(resnum);
		return ""+i;
	}
	
	@GetMapping("/adminRes/info")
	public void memsInfo(HttpServletResponse response) {
		
		String fileName = "";
		try {
			  fileName = new String("예약 현황.xlsx".getBytes("utf-8"), "iso-8859-1");			  
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setContentType("ms-vnd/excel");
		
		response.setContentType("application/octet-stream; charset=utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
			
		List<AdminResDto> reslist = service.adminResList();
		
		Workbook workbook = new SXSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("첫번째 시트");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		
				row = sheet.createRow(rowNum++);
				cell = row.createCell(0);
				cell.setCellValue("예약번호");
				cell = row.createCell(1);
				cell.setCellValue("이름");
				cell = row.createCell(2);
				cell.setCellValue("예약일자");
				cell = row.createCell(3);
				cell.setCellValue("예약시간");
				cell = row.createCell(4);
				cell.setCellValue("코스");
				cell = row.createCell(5);
				cell.setCellValue("금액");
				
				
				for (int i = 0; i < reslist.size(); i++) {
					row = sheet.createRow(rowNum++);
					AdminResDto r = reslist.get(i);
					cell = row.createCell(0);
					cell.setCellValue(r.getResnum());
					cell = row.createCell(1);
					cell.setCellValue(r.getName());
					cell = row.createCell(2);
					cell.setCellValue(format(r.getResdate()));
					cell = row.createCell(3);
					cell.setCellValue(r.getRestime());
					cell = row.createCell(4);
					cell.setCellValue(r.getRescourse());
					cell = row.createCell(5);
					cell.setCellValue(r.getPrice());
				}
				
				try {
					workbook.write(response.getOutputStream());
					workbook.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	}
	private static String format(Date d) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(d);
	}

	
	
}
