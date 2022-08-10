package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.vo.Member;

@Repository
public interface MemberDao {
	
	public void register(Member ins);
	public int checkEmail(String email);
	public Member memberLogin(Member m);
	public List<Member> getMemberList(Member sch);
	public Member getMemberDetail(int mid);
	public void authorize(Member upt);
	public void deleteMember(int mid);
	public void uptEmpnoAndPassword(Member upt);
	public void recoverPassword(Member upt);
}
