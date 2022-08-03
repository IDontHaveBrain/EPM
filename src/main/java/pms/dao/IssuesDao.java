package pms.dao;

import org.springframework.stereotype.Repository;

import pms.vo.Issues;

@Repository
public interface IssuesDao {
	
	public void insertIssue(Issues ins);
}
