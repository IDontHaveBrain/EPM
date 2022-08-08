package pms.dao;

import javax.servlet.http.HttpServletResponse;

import pms.vo.Member;

public interface MailDao {
	
	//이메일발송
	public void sendEmail(Member member, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, Member member) throws Exception;

}
