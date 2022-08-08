package pms.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import pms.dao.MemberDao;
import pms.vo.Mail;
import pms.vo.Member;

@Service
public class MailSenderService {
	// 컨테이너에 있는 메일 발송 객체 autowiring 처리
	@Autowired(required = false)
	private JavaMailSender sender;
	private MemberDao dao;
	
	
	public String sendMail(Mail mail, Member member) {
		String msg = "메일 발송 성공"; // 메일 발송이 성공되었을 때,
		String pw = "";
		
		// 처리할 메소드 선언
		// 1. 멀티미디어형 메일 데이터 전송
		MimeMessage mmsg = sender.createMimeMessage();
		// 2. 제목 설정
		try {
			mmsg.setSubject("ㅎㅇ" + member.getName());
			// 3. 수신자 설정
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(member.getEmail()));
			// 4. 내용 설정
			mmsg.setText(pw);
			// 5. 발송 처리
			sender.send(mmsg);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "메일 발송 에러:" + e.getMessage();
			System.out.println(msg);
		} catch (Exception e) {
			msg = "일반 에러 발생:" + e.getMessage();
		}
		Member ck = dao.getMemberDetail(member.getMid());
		// 가입된 아이디가 없으면
		if(dao.idCheck(member.getEmail())) {
		}
		// 가입된 이메일이 아니면
		else if(!member.getEmail().equals(ck.getEmail())) {
		}else {
			// 임시 비밀번호 생성
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setPassword(pw);
			// 비밀번호 변경
			dao.uptEmpnoAndPassword(member);
			// 비밀번호 변경 메일 발송
			sendMail(mail, member);

		}
		return msg;
	}
}
