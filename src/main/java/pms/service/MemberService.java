package pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.MemberDao;
import pms.vo.Member;
import pms.vo.MemberSch;

@Service
public class MemberService {

	@Autowired(required=false)
	private MemberDao dao;
	
	// 사원 등록
	public void register(Member ins) {
		dao.register(ins);
	}
	
	// 이메일 중복체크
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}
	
	// 로그인
	public Member memberLogin(Member m){
		return dao.memberLogin(m);
	}
	
	// 개별 사원 디테일 mid값으로 호출 
	public Member getMemberDetail(int mid) {
		return dao.getMemberDetail(mid);
	}
	
	// 사원 권한부여 업데이트
	public void authorize(Member upt) {
		dao.authorize(upt);
	}
	
	// 사원 삭제
	public void deleteMember(int mid) {
		dao.deleteMember(mid);
	}
	
	// 이메일 발송 시 이름 값 저장
	public String getMemberName(Member sch) {
		return dao.getMemberName(sch);
	}
	
	// 마이페이지 비밀번호 변경
	public void uptPassword(Member upt) {
		dao.uptPassword(upt);
	}
	
	public List<Member> memberList(MemberSch sch){
		// 1. 전체 데이터 건수 설정
		sch.setCount( dao.totCnt(sch) );
		System.out.println("총건수:"+sch.getCount());
		// 2. 선언한 한번에 보여줄 데이터 건수(요청값)
		//		초기화면을 대비하여 한번에 보여줄 데이터건수를 선언
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
		// 3. 총페이지수 : 데이터건수/한번에 보여줄 페이지 크기
		//	ex) 18/5 ==> 3
		//	ex) 18/5.0 (실수) ==> Math.ceil(3.6) : 4 ==> 정수형으로 변환하여 4를 총페이지수로 처리
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		// 4. 클릭한 현재 페이지 번호..(요청값)
		//		1 => 1~5
		//		2 => 6~10
		//		3 => 11~15
		//		초기에 화면은 0으로 처리되기에 default 값을 1로 처리한다.
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 블럭단위로 next를 눌렀을 때, curPage가 증가되는 것을 방지
		if(sch.getCurPage()>sch.getPageCount()){
			sch.setCurPage(sch.getPageCount());
		}
		// 5. 마지막번호(현재페이지*한번에보여줄페이지건수)
		int end = sch.getCurPage()*sch.getPageSize();
		if(end>sch.getCount()) { // 총데이터 건수보다 크면..
			sch.setEnd(sch.getCount());
		}else {
			sch.setEnd(end);
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		//			1	(1-1)*5+1 : 1
		//			2	(2-1)*5+1 : 6
		//			3	(3-1)*5+1 : 11
		// 하단에 <이전		이후> 블럭 처리
		// 1. 블럭의 크기 지정
		sch.setBlockSize(5);
		// 2. 블럭의 번호 지정..
		//	  1번블럭  [1]...[5]
		//	  2번블럭  [6]...[10]
		//	  3번블럭  [11]...[15]
		//			 [11][12][13]
		int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
		
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>=sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		
		return dao.memberList(sch);
	}
	
	
}
