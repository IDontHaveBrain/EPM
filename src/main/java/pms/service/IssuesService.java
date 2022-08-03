package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.IssuesDao;
import pms.vo.Issues;

@Service
public class IssuesService {

	@Autowired(required=false)
	private IssuesDao dao;
	
	public void insertIssue(Issues ins) {
		dao.insertIssue(ins);
	}
}
