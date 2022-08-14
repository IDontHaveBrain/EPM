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
    
   
    public void createProject(ProjectDto ins) {   	
        dao.insertProject(ins);
        
        dao.insertParticipants(new Participants(ins.getSelectPM(), "PM"));
        
        for(int m:ins.getSelectmember()) { 
            dao.insertParticipants(new Participants(m, "Developer"));
        }
        
     }
    
    public Project updateProject(ProjectDto upt) {
    	
        dao.updateProject(upt);       
        return dao.getProjectDetail(upt.getPid()); 
     }
    
    public void deleteProject(int pid) {   	
    	dao.deleteMember(pid);
    	dao.deleteProject(pid);    
    }



	
}
