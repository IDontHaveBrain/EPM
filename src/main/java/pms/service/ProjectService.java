package pms.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.ProjectDao;
import pms.dto.ProjectDto;
import pms.dto.ProjectMemberDTO;
import pms.vo.Member;
import pms.vo.Participants;
import pms.vo.Project;

@Service
public class ProjectService {
    @Autowired(required = false)
    private ProjectDao dao;
    
    public List<Project> getProjectList(){
    	return dao.getProjectList();
	}
    
    public List<Member> getMemberList(){
    	return dao.getMemberList();
	}
    
    public List<ProjectMemberDTO> getPmemberList(int pid) {
    
    	
    	return dao.getPmemberList(pid);
	}
 
	
    public Project getProjectDetail(int pid){
      	return dao.getProjectDetail(pid);
    }
    
    // pname=%ED%85%8C%EC%8A%A4%ED%8A%B8%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8&selectPM=2&selectmember=5&selectmember=7&selectmember=11&pcomment=%E3%85%87%E3%84%B9%E3%84%B4%E3%85%87%E3%84%B9%E3%85%87%E3%84%B4&pstart=2022-08-18&pend=2022-09-08
    
    public void createProject(ProjectDto ins) {   	
        dao.insertProject(ins);
        
        dao.insertParticipants(new Participants(ins.getSelectPM(), "PM"));
        
        for(int m:ins.getSelectmember()) {
           dao.insertParticipants(new Participants(m, "Developer"));
        }
        
     }

    
	public void deleteProject(int pid) {
		dao.deleteProject(pid);
	}


	
}
