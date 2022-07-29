package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.MemberDao;
import pms.vo.Member;

@Service
public class MemberService {

	@Autowired(required=false)
	private MemberDao dao;
	
	public void register(Member ins) {
		dao.register(ins);
	}
	
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}
}
