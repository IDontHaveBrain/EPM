package pms.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.ProjectDao;
import pms.vo.Project;


@Service
public class ProjectService {
    @Autowired(required = false)
    private ProjectDao dao;
    
    public List<Project> getProjectList(){
    	return dao.getProjectList();
	}
    public Project getProjectDetail(int pid){
      	return dao.getProjectDetail(pid);
    }
    
    public void insertProject(Project ins) {
    	dao.insertProject(ins);
    }	
    
	public void deleteProject(int pid) {
		dao.deleteProject(pid);
	}
}
