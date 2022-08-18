package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.MemberDao;
import pms.vo.Member;
import pms.vo.MemberProfile;

@Service
public class ChatService {
	@Autowired(required=false)
	private MemberDao dao;
	
	public Member getMemberDetail(int mid) {
		return dao.getMemberDetail(mid);
	}
	
	public MemberProfile getProfile(int mid) {
		return dao.getProfile(mid);
	}
	

}
