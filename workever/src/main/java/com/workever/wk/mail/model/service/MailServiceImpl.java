package com.workever.wk.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.mail.model.dao.MailDao;
import com.workever.wk.mail.model.vo.Mail;
import com.workever.wk.mail.model.vo.MailFiles;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	// 받은메일함
	
	/**
	 * 받은 메일 총 개수
	 */
	@Override
	public int selectIncomingMailListCount(String mrUserNo) {
		
		return mDao.selectIncomingMailListCount(sqlSession, mrUserNo);
		
	}

	/**
	 * 받은 메일 목록 조회
	 */
	@Override
	public ArrayList<Mail> selectIncomingMailList(PageInfo pi, String mrUserNo) {
		
		return mDao.selectIncomingMailList(sqlSession, pi, mrUserNo);
		
	}
	
	/**
	 * 받은메일 삭제(삭제메일함으로 이동)
	 */
	@Override
	public int deleteTrashIncomingMail(String mrNo) {
		
		return mDao.deleteTrashIncomingMail(sqlSession, mrNo);
		
	}
	
	/**
	 * 메일 읽음 처리
	 */
	@Override
	public int updateRead(String mrNo) {
		
		return mDao.updateRead(sqlSession, mrNo);
		
	}
	
	/**
	 * 메일 안읽음 처리
	 */
	@Override
	public int updateNoRead(String mrNo) {
		
		return mDao.updateNoRead(sqlSession, mrNo);
		
	}

	/**
	 * 받은 메일 상세 조회
	 */
	@Override
	public Mail selectIncomingMail(Mail m) {
		
		return mDao.selectIncomingMail(sqlSession, m);
		
	}

	/**
	 * 참조자 목록 조회
	 */
	@Override
	public ArrayList<Mail> selectCcList(String msNo) {
		
		return mDao.selectCcList(sqlSession, msNo);
		
	}

	/**
	 * 첨부파일 목록 조회
	 */
	@Override
	public ArrayList<MailFiles> selectMailFileList(String msNo) {
		
		return mDao.selectMailFileList(sqlSession, msNo);
		
	}
	
	
	
	// 보낸메일함
	
	/**
	 * 보낸메일 총 개수
	 */
	@Override
	public int selectOutgoingMailListCount(String msUserNo) {
		
		return mDao.selectOutgoingMailListCount(sqlSession, msUserNo);
		
	}

	/**
	 * 보낸메일 목록 조회
	 */
	@Override
	public ArrayList<Mail> selectOutgoingMailList(PageInfo pi, String msUserNo) {
		
		return  mDao.selectOutgoingMailList(sqlSession, pi, msUserNo);
		
	}
	
	/**
	 * 보낸메일 완전 삭제
	 */
	@Override
	public int deleteOutgoingMailList(String msNo) {
		
		return mDao.deleteOutgoingMailList(sqlSession, msNo);
		
	}	
	
	/**
	 * 보낸메일 상세 조회
	 */
	@Override
	public Mail selectOutgoingMail(String msNo) {
		
		return mDao.selectOutgoingMail(sqlSession, msNo);
		
	}

	/**
	 * 수신자 목록 조회
	 */
	@Override
	public ArrayList<Mail> selectReceiveList(String msNo) {
		
		return mDao.selectReceiveList(sqlSession, msNo);
		
	}

	
	
	// 삭제메일함

	/**
	 * 삭제 메일 총 개수
	 */
	@Override
	public int selectTrashMailListCount(String mrUserNo) {
		
		return mDao.selectTrashMailListCount(sqlSession, mrUserNo);
		
	}

	/**
	 * 삭제 메일 목록 조회
	 */
	@Override
	public ArrayList<Mail> selectTrashMailList(PageInfo pi, String mrUserNo) {
		
		return mDao.selectTrashMailList(sqlSession, pi, mrUserNo);
		
	}

	/**
	 * 받은메일 완전 삭제
	 */
	@Override
	public int deleteIncomingMailList(String mrNo) {
		
		return mDao.deleteIncomingMailList(sqlSession, mrNo);
		
	}

	/**
	 * 완전 삭제 안된 발신자 메일 수
	 */
	@Override
	public int selectExistingSenderMailCount(String msNo) {
		
		return mDao.selectExistingSenderMailCount(sqlSession, msNo);
		
	}

	/**
	 * 완전 삭제 안된 수신자/참조자 메일 수
	 */
	@Override
	public int selectExistingReceiverMailCount(String msNo) {
		
		return mDao.selectExistingReceiverMailCount(sqlSession, msNo);
		
	}

	/**
	 * 발신자 및 수신자, 참조자 메일 완전 삭제 시 첨부파일 목록 삭제
	 */
	@Override
	public int deleteMailFileList(String msNo) {
		
		return mDao.deleteMailFileList(sqlSession, msNo);
		
	}
	
	/**
	 * 보낸메일 완전 삭제
	 */
	@Override
	public int deleteOutGoingMailList(String msNo) {
		
		return 0;
		
	}

	/**
	 * 받은메일함으로 메일 이동
	 */
	@Override
	public int updateToInbox(String mrNo) {
		
		return mDao.updateToInbox(sqlSession, mrNo);
		
	}

}
