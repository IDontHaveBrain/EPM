package pms.service;

import java.util.List;

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
	
	public Member memberLogin(Member m){
		return dao.memberLogin(m);
	}
	
	public List<Member> getMemberList(Member sch) {
		return dao.getMemberList(sch);
	}
	
	public Member getMemberDetail(int mid) {
		return dao.getMemberDetail(mid);
	}
	
	public void authorize(Member upt) {
		dao.authorize(upt);
	}
	
	public void deleteMember(int mid) {
		dao.deleteMember(mid);
	}
	
}
