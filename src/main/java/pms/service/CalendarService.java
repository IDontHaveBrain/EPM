package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.CalendarDao;
import pms.vo.CalendarMember;

import java.util.List;

@Service
public class CalendarService {
	@Autowired(required=false)
	private CalendarDao dao;
	
	public List<CalendarMember> getCalList(){
		return dao.getCalList();
	}
	public void insertCalendar(CalendarMember ins) {
		dao.insertCalendar(ins);
	}
	public void updateCalendar(CalendarMember upt) {
		dao.updateCalendar(upt);
	}
	public void deleteCalendar(int id) {
		dao.deleteCalendar(id);
	}
	
}
