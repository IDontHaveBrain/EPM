package pms.dao;

import org.springframework.stereotype.Repository;

import pms.vo.Member;

@Repository
public interface MemberDao {
	
	public void register(Member ins);
	public int checkEmail(String email);
	public Member loginMember(Member m);
}
