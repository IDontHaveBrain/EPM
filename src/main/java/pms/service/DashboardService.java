package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.DashboardDao;
import pms.dto.IssuesDashDto;
import pms.dto.IssuesSch;
import pms.dto.NoticeSch;
import pms.vo.Notice;

import java.util.List;

@Service
public class DashboardService {
    @Autowired(required = false)
    private DashboardDao dao;

    public List<Notice> getNoticeList(int pid) {
        return dao.noticeList(pid);
    }
    public List<IssuesDashDto> getIssueList(int pid) {
        return dao.issueList(pid);
    }
    public List<IssuesDashDto> issuePaging(IssuesSch sch, int pid){
        sch.setPid(pid);

        // 1. 전체 데이터 건수 설정
        sch.setCount(	dao.issueTotCnt(1) ); // 프로젝트 선택파트 완료시 pid로 변경
        System.out.println("총건수:"+sch.getCount());
        // 2. 선언한 한번에 보여줄 데이터 건수(요청값)
        sch.setPageSize(3);
        // 3. 총페이지수 : 데이터건수/한번에 보여주페이지 크기  [1][2][3][4]
        //    ex) 18/5 ==> 3
        //    ex) 18/5.0 (실수) ==> Math.ceil(3.6) : 4.0 ==> 정수형으로 변환하여 4를 총페이지수로 처리
        sch.setPageCount( (int)Math.ceil( sch.getCount() /(double)sch.getPageSize()) );
        // 4. 클릭한 현재 페이지 번호..(요청값)
        if(sch.getCurPage()==0) {
            sch.setCurPage(1);
        }
        if(sch.getCurPage() > sch.getPageCount()){
            sch.setCurPage(sch.getPageCount());
        }
        // 5. 마지막번호(현재페이지*한번에보여주는페이지건수)
        int end = sch.getCurPage()*sch.getPageSize();
        if(end>sch.getCount()) { // 총데이터 건수보다 크면..
            sch.setEnd(sch.getCount());
        }else {
            sch.setEnd(end);
        }
        sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);


        // 1. 블럭의 크기 지정.
        sch.setBlockSize(3);
        // 2. 블럭의 번호 지정..
        int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));

        int endBlock = blocknum*sch.getBlockSize();
        if(endBlock>sch.getPageCount()) {
            endBlock = sch.getPageCount();
        }
        sch.setEndBlock(endBlock);
        sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);

        return dao.issueListPage(sch);
    }
    public List<Notice> noticePaging(NoticeSch sch, int pid){
        sch.setPid(pid);

        // 1. 전체 데이터 건수 설정
        sch.setCount(	dao.noticeTotCnt(1) ); // 프로젝트 선택파트 완료시 pid로 변경
        System.out.println("총건수:"+sch.getCount());
        // 2. 선언한 한번에 보여줄 데이터 건수(요청값)
        sch.setPageSize(3);
        // 3. 총페이지수 : 데이터건수/한번에 보여주페이지 크기  [1][2][3][4]
        //    ex) 18/5 ==> 3
        //    ex) 18/5.0 (실수) ==> Math.ceil(3.6) : 4.0 ==> 정수형으로 변환하여 4를 총페이지수로 처리
        sch.setPageCount( (int)Math.ceil( sch.getCount() /(double)sch.getPageSize()) );
        // 4. 클릭한 현재 페이지 번호..(요청값)
        if(sch.getCurPage()==0) {
            sch.setCurPage(1);
        }
        if(sch.getCurPage() > sch.getPageCount()){
            sch.setCurPage(sch.getPageCount());
        }
        // 5. 마지막번호(현재페이지*한번에보여주는페이지건수)
        int end = sch.getCurPage()*sch.getPageSize();
        if(end>sch.getCount()) { // 총데이터 건수보다 크면..
            sch.setEnd(sch.getCount());
        }else {
            sch.setEnd(end);
        }
        sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);


        // 1. 블럭의 크기 지정.
        sch.setBlockSize(3);
        // 2. 블럭의 번호 지정..
        int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));

        int endBlock = blocknum*sch.getBlockSize();
        if(endBlock>sch.getPageCount()) {
            endBlock = sch.getPageCount();
        }
        sch.setEndBlock(endBlock);
        sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);

        return dao.noticeListPage(sch);
    }
}