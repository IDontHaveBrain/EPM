package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.GlobalDao;
import pms.vo.Jobplan;
import pms.vo.Member;

import java.util.List;

@Service
public class GlobalService {
    @Autowired(required = false)
    private GlobalDao dao;

    public Member getMember(String email) {
        return dao.getMember(email);
    }
    public List<Jobplan> jobplanListPrj(int pid) {
        return dao.jobplanListPrj(pid);
    }
}
