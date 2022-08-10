package pms.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.dao.WorkPageDao;
import pms.vo.WorkPage;
import pms.vo.WorkPageFile;

@Service
public class WorkPageService {
	@Autowired(required=false)
	private WorkPageDao dao;
	
    public List<WorkPage> WorkPageList(int mid,int pid) {
        return dao.WorkPageList(mid,pid);
    }
	public List<WorkPage> getWorkPageList(WorkPage sch,int mid,int pid){
		sch.setMid(mid);
		sch.setPid(pid);
		return dao.getWorkPageList(sch);
	}
	
	// 상세화면
	public List<WorkPage> WorkPageDetailList(int mid,int jid){
		return dao.WorkPageDetailList(mid, jid);
	}
	public List<WorkPage> getWokrPageDetail(WorkPage sch,int mid,int jid){
		sch.setMid(mid);
		sch.setJid(jid);
		return dao.getWorkPageDetailList(sch);
	}	
	// 상세화면 파일다운로드 데이터
	public List<WorkPage> getWorkPageFile(WorkPage filelist,int mid,int jid,int jmid){
			filelist.setMid(mid);
			filelist.setJid(jid);
			filelist.setJmid(jmid);
			System.out.println("test1:"+mid);
			System.out.println("test1:"+jid);
			System.out.println("test1:"+jmid);
//			List<WorkPage> dddd = dao.getWorkPageFile(filelist);
//			System.out.println("test2:"+dddd.get());

		return dao.getWorkPageFile(filelist);
	}
	
	// 파일서버 정보(공통정보)
	@Value("${upload}")
	private String path;
	public void insertWorkPageFile(WorkPageFile ins) {
		MultipartFile mpf = ins.getReport();
		String fname = mpf.getOriginalFilename();
		System.out.println("jmid 값 가져오냐?"+ins.getJmid());
		File f = new File(path+fname);
		try {
			mpf.transferTo(f);
			System.out.println("파일업로드 완성");
			// IO(input/output)일어나는 경우에는 일반적으로 필수예외처리(compile예외처리)
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// dao.insertWorkPageFile(ins); // 기본정보가 등록  key(no)
		dao.insertFile(new WorkPageFile(path,fname)); // 위 게시물의 key를 가져와서 파일정보에 등록
		
	// 		insert into  boardfile values(board_seq.currval,
	// 	     #{path}, #{fname}, sysdate, sysdate, '')	
		
		
	}
}
