package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.GlobalDao;
import pms.vo.Member;

@Service
public class GlobalService {
    @Autowired(required = false)
    private GlobalDao dao;

    public Member getMember(String email) {
        return dao.getMember(email);
    }
}
