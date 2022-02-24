package com.workever.wk.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.mail.model.vo.Mail;
import com.workever.wk.mail.model.vo.MailFiles;

@Repository
public class MailDao {
	
	// 받은메일함
	
	/** 받은메일 총 개수
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public int selectIncomingMailListCount(SqlSessionTemplate sqlSession, String mrUserNo) {
		
		return sqlSession.selectOne("mailMapper.selectIncomingMailListCount", mrUserNo);
		
	}

	/** 받은메일 목록 조회
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public ArrayList<Mail> selectIncomingMailList(SqlSessionTemplate sqlSession, PageInfo pi, String mrUserNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectIncomingMailList", mrUserNo, rowBounds);
		
	}
	
	/** 받은메일 삭제(삭제메일함으로 이동)
	 * @param sqlSession
	 * @param mrNo
	 * @return
	 */
	public int deleteTrashIncomingMail(SqlSessionTemplate sqlSession, String mrNo) {
		
		return sqlSession.update("mailMapper.deleteTrashIncomingMail", mrNo);
		
	}
	
	/** 메일 읽음 처리
	 * @param sqlSession
	 * @param mrNo
	 * @return
	 */
	public int updateRead(SqlSessionTemplate sqlSession, String mrNo) {
		
		return sqlSession.update("mailMapper.updateRead", mrNo);
		
	}
	
	/** 메일 안읽음 처리
	 * @param sqlSession
	 * @param mrNo
	 * @return
	 */
	public int updateNoRead(SqlSessionTemplate sqlSession, String mrNo) {
		
		return sqlSession.update("mailMapper.updateNoRead", mrNo); 
	}
	
	/** 받은메일 상세 조회
	 * @param sqlSession
	 * @param mrNo
	 * @return
	 */
	public Mail selectIncomingMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.selectOne("mailMapper.selectIncomingMail", m);
		
	}
	
	/** 참조자 목록 조회
	 * @param sqlSession
	 * @param m
	 * @return
	 */
	public ArrayList<Mail> selectCcList(SqlSessionTemplate sqlSession, String msNo) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectCcList", msNo);
		
	}
	
	/** 첨부파일 목록 조회
	 * @param sqlSession
	 * @param m
	 * @return
	 */
	public ArrayList<MailFiles> selectMailFileList(SqlSessionTemplate sqlSession, String msNo) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailFileList", msNo);
		
	}
	
	
	
	// 보낸메일함
	
	/** 보낸메일 총 개수
	 * @param sqlSession
	 * @param msUserNo
	 * @return
	 */
	public int selectOutgoingMailListCount(SqlSessionTemplate sqlSession, String msUserNo) {
		
		return sqlSession.selectOne("mailMapper.selectOutgoingMailListCount", msUserNo);
		
	}

	/** 보낸메일 목록 조회
	 * @param sqlSession
	 * @param pi
	 * @param msUserNo
	 * @return
	 */
	public ArrayList<Mail> selectOutgoingMailList(SqlSessionTemplate sqlSession, PageInfo pi, String msUserNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return  (ArrayList)sqlSession.selectList("mailMapper.selectOutgoingMailList", msUserNo, rowBounds);
		
	}
	
	/** 보낸메일 완전 삭제
	 * @param sqlSession
	 * @param msNo
	 * @return
	 */
	public int deleteOutgoingMailList(SqlSessionTemplate sqlSession, String msNo) {
		
		return sqlSession.update("mailMapper.deleteOutgoingMailList", msNo);
		
	}
	
	/** 보낸메일 상세 조회
	 * @param sqlSession
	 * @param msNo
	 * @return
	 */
	public Mail selectOutgoingMail(SqlSessionTemplate sqlSession, String msNo) {
		
		return sqlSession.selectOne("mailMapper.selectOutgoingMail", msNo);
		
	}

	/** 수신자 목록 조회
	 * @param sqlSession
	 * @param msNo
	 * @return
	 */
	public ArrayList<Mail> selectReceiveList(SqlSessionTemplate sqlSession, String msNo) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveList", msNo);
		
	}
	
	
	
	// 삭제메일함
	
	/** 삭제메일 총 개수
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public int selectTrashMailListCount(SqlSessionTemplate sqlSession, String mrUserNo) {
		
		return sqlSession.selectOne("mailMapper.selectTrashMailListCount", mrUserNo);
		
	}

	/** 삭제 메일 목록 조회
	 * @param sqlSession
	 * @param pi
	 * @param userNo
	 * @return
	 */
	public ArrayList<Mail> selectTrashMailList(SqlSessionTemplate sqlSession, PageInfo pi, String mrUserNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectTrashMailList", mrUserNo, rowBounds);
		
	}

	/** 받은메일 완전 삭제
	 * @param sqlSession
	 * @param mrNo
	 * @return
	 */
	public int deleteIncomingMailList(SqlSessionTemplate sqlSession, String mrNo) {
		
		return sqlSession.update("mailMapper.deleteIncomingMailList", mrNo);
		
	}

	/** 완전 삭제 안된 발신자 메일 수
	 * @param sqlSession
	 * @param msNo
	 * @return
	 */
	public int selectExistingSenderMailCount(SqlSessionTemplate sqlSession, String msNo) {
		
		return sqlSession.selectOne("mailMapper.selectExistingSenderMailCount", msNo);
	}

	/** 완전 삭제 안된 수신자/참조자 메일 수
	 * @param sqlSession
	 * @param mrMsNo
	 * @return
	 */
	public int selectExistingReceiverMailCount(SqlSessionTemplate sqlSession, String msNo) {
		
		return sqlSession.selectOne("mailMapper.selectExistingReceiverMailCount", msNo);
		
	}
	
	/** 발신자 및 수신자, 참조자 메일 완전 삭제 시 첨부파일 목록 삭제
	 * @param sqlSession
	 * @param mfMsNo
	 * @return
	 */
	public int deleteMailFileList(SqlSessionTemplate sqlSession, String msNo) {
		
		return sqlSession.delete("mailMapper.deleteMailFileList", msNo);
		
	}

	/** 보낸메일 완전 삭제
	 * @param sqlSession
	 * @param mrNo
	 * @return
	 */
	public int deleteOutGoingMailList(SqlSessionTemplate sqlSession, String msNo) {
		
		return 0;
		
	}
	
	/** 받은메일함으로 메일 이동
	 * @param sqlSession
	 * @param mrNo
	 * @return
	 */
	public int updateToInbox(SqlSessionTemplate sqlSession, String mrNo) {
		
		return sqlSession.update("mailMapper.updateToInbox", mrNo);
		
	}
	
}
