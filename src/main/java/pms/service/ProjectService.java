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
    public Project getProjectDetail(int number){
      	return dao.getProjectDetail(number);
    }
    
    public void insertProject(Project ins) {
    	dao.insertProject(ins); // 기본정보가 등록  key(no)->pid
    }	
}
