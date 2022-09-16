package com.finalProject.eduWorks.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.approval.model.vo.Draft;
import com.finalProject.eduWorks.approval.model.vo.Leave;
@Repository
public class ApprovalDao {
	
	
		public int insertDtpaper(SqlSessionTemplate sqlSession, Draft d) {
			return sqlSession.insert("signMapper.insertDraft", d);
		}
		public int insertVacation(SqlSessionTemplate sqlSession, Leave l) {
			return sqlSession.insert("signMapper.insertVacation", l);
		}

}
