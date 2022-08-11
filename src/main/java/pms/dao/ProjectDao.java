package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.vo.Member;

import pms.vo.Project;



@Repository
public interface ProjectDao {
	public List<Project> getProjectList();
	public List<Member> getMemberList(int empno);
	public Project getProjectDetail(int pid);
	
	public void insertProject(Project ins);
	//public void insertPartmem(Participants ins);
	
	public void deleteProject(int pid);
}
