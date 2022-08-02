package pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.WorkPageDao;
import pms.vo.WorkPage;

@Service
public class WorkPageService {
	@Autowired(required=false)
	private WorkPageDao dao;
	
	public List<WorkPage> getWorkPageList(int required){
		return dao.getWorkPageList(required);
	}
}
