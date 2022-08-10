package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.dto.JobDTO;
import pms.dto.JobMemberDTO;

@Repository
public interface PMDao {
	List<JobDTO> getJobPlan(int pid);
	List<JobMemberDTO> getJobMember(int jid);
	List<JobMemberDTO> getParticipants(int pid);
}