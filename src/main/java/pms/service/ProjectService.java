package pms.service;


import org.springframework.beans.factory.annotation.Autowired;


import pms.dao.ProjectDao;
import pms.vo.Project;

public class ProjectService {
    @Autowired(required = false)
    private ProjectDao dao;
    

	
}
