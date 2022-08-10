package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pms.service.CalendarService;
import pms.dto.CalendarMember;

@Controller
public class CalendarController {
	@Autowired(required = false)
	private CalendarService service;
	// http://localhost:7080/springweb/calendar.do
	@RequestMapping("calendar.do")
	public String calendar() {
		return "WEB-INF/views/calendar/calendarMember.jsp";
	}
	// http://localhost:7080/springweb/calList.do callist
	@RequestMapping("calList.do")
	public String calList(Model d) {
		d.addAttribute("callist", service.getCalList());
		return "pageJsonReport";
	}
	// http://localhost:7080/springweb/calInsert.do
	@RequestMapping("calInsert.do")
	public String calInsert(CalendarMember ins) {
		service.insertCalendar(ins);
		
		// 등록 후, 초기화면으로 이동
		return "redirect:/calendar.do";
	} // calUpdate.do calDelete.do
	// http://localhost:7080/springweb/calUpdate.do
	@RequestMapping("calUpdate.do")
	public String updateCalendar(CalendarMember upt) {
		System.out.println("## 수정 ##");
		System.out.println(upt.getTitle());
		System.out.println(upt.getCstart());
		
		
		service.updateCalendar(upt);
		return "redirect:/calendar.do";
	}
	// http://localhost:7080/springweb/calDelete.do
	@RequestMapping("calDelete.do")
	public String deleteCalendar(int mcid) {
		service.deleteCalendar(mcid);
		return "redirect:/calendar.do";
	}
}

