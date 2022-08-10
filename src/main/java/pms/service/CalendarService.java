package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.CalendarDao;
import pms.dto.CalendarMember;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

@Service
public class CalendarService {
	@Autowired(required=false)
	private CalendarDao dao;
	
	public List<CalendarMember> getCalList(int mid){
		List<CalendarMember> list = dao.getCalList(mid);
		for(CalendarMember calendar : list){
			calendar.setId(calendar.getMcid());
			SimpleDateFormat sdf;
			sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
			sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
			String datetime = sdf.format(calendar.getCstart());
			calendar.setStart(datetime);
			datetime = sdf.format(calendar.getCend());
			calendar.setEnd(datetime);
		}
		return list;
	}
	public void insertCalendar(CalendarMember ins) {
		SimpleDateFormat sdf;
		sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		try {
			ins.setCstart(sdf.parse(ins.getStart()));
			ins.setCend(sdf.parse(ins.getEnd()));
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		dao.insertCalendar(ins);
	}
	public void updateCalendar(CalendarMember upt) {
		SimpleDateFormat sdf;
		sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		try {
			System.out.println(upt.getStart());
			System.out.println(sdf.parse(upt.getStart()));
			upt.setCstart(sdf.parse(upt.getStart()));
			upt.setCend(sdf.parse(upt.getEnd()));
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		dao.updateCalendar(upt);
	}
	public void deleteCalendar(int mcid) {
		dao.deleteCalendar(mcid);
	}
	
}
