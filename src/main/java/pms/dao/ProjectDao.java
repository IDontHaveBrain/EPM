package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.vo.Project;



@Repository
public interface ProjectDao {
	public List<Project> getProjectList();
	public Project getProjectDetail(int pid);
	public void insertProject(Project ins);
	public void deleteProject(int pid);
}
