package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.dto.ProjectMemberDTO;
import pms.vo.Member;
import pms.vo.Project;



@Repository
public interface ProjectDao {
	public List<Project> getProjectList();
	public List<Member> getMemberList();
	public List<ProjectMemberDTO> getPmemberList(int pid); //조회
	
	//public void<Participants> - 수정, 등록
	public Project getProjectDetail(int pid);
	
	public void insertProject(Project ins);
	//public void insertPartmem(Participants ins);
	
	public void deleteProject(int pid);
}
