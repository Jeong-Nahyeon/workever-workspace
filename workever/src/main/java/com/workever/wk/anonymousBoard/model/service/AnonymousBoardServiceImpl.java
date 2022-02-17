package com.workever.wk.anonymousBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.anonymousBoard.model.dao.AnonymousBoardDao;
import com.workever.wk.anonymousBoard.model.vo.AnonymousBoard;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

@Service
public class AnonymousBoardServiceImpl implements AnonymousBoardService {
	
	@Autowired
	private AnonymousBoardDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 익명 게시글 총 개수
	 */
	@Override
	public int selectListCount() {
		
		return aDao.selectListCount(sqlSession);
		
	}

	/**
	 * 익명 게시글 목록 조회(페이징 처리)
	 */
	@Override
	public ArrayList<AnonymousBoard> selectAnonymousBoardList(PageInfo pi) {
		
		return aDao.selectAnonymousBoardList(sqlSession, pi);
		
	}

	/**
	 * 익명 게시글 조회수 증가
	 */
	@Override
	public int increaseCount(String abNo) {
		
		return aDao.increaseCount(sqlSession, abNo);
		
	}

	/**
	 * 익명 게시글 상세 조회
	 */
	@Override
	public AnonymousBoard selectAnonymousBoard(String abNo) {
		
		return aDao.selectAnonymousBoard(sqlSession, abNo);
		
	}

	/**
	 * 익명 게시글번호로 첨부파일 목록 조회
	 */
	@Override
	public ArrayList<CommunityFiles> selectCommunityFileList(String abNo) {
		
		return aDao.selectCommunityFileList(sqlSession, abNo);
		
	}

	/**
	 * 익명 게시글 등록 및 첨부파일 목록 등록
	 */
	@Override
	public int insertAnonymousBoard(AnonymousBoard ab, ArrayList<CommunityFiles> list) {

		int result1 = aDao.insertAnonymousBoard(sqlSession, ab);
				
		int result2 = 1;
		
		if(!list.isEmpty()) { // 첨부파일 있을 경우에만 실행되도록 조건 검사
			
			result2 = aDao.insertCommunityFileList(sqlSession, list);
			
		}
		
		return result1 * result2;
		
	}

	/**
	 * 파일번호로 부서별 게시글 첨부파일 조회 
	 */
	@Override
	public CommunityFiles selectCommunityFile(int cfNo) {
		
		return aDao.selectCommunityFile(sqlSession, cfNo);
		
	}

	/**
	 * 파일번호로 부서별 게시글 첨부파일 삭제
	 */
	@Override
	public int deleteCommunityFile(int cfNo) {
		
		return aDao.deleteCommunityFile(sqlSession, cfNo);
		
	}

	/**
	 * 부서별 게시글 수정 및 새로운 첨부파일 등록
	 */
	@Override
	public int updateAnonymousBoard(AnonymousBoard ab, ArrayList<CommunityFiles> list) {
		
		int result1 = aDao.updateAnonymousBoard(sqlSession, ab);
		
		int result2 = 1;
		
		if(!list.isEmpty()) { // 첨부파일 있을 경우에만 실행되도록 조건 검사
			
			result2 = aDao.updateCommunityFileList(sqlSession, list);
			
		}
		
		return result1 * result2;
		
	}

	/**
	 * 익명 게시글 삭제
	 */
	@Override
	public int deleteAnonymousBoard(String abNo) {
		
		return aDao.deleteAnonymousBoard(sqlSession, abNo);
		
	}

	/**
	 * 익명 게시글 삭제 시 해당 게시글의 댓글 목록 삭제
	 */
	@Override
	public int deleteCommunityReplyList(String abNo) {
		
		return aDao.deleteCommunityReplyList(sqlSession, abNo);
		
	}

	/**
	 * 익명 게시글 첨부파일 목록 삭제
	 */
	@Override
	public int deleteCommunityFileList(String abNo) {
		
		return aDao.deleteCommunityFileList(sqlSession, abNo);
		
	}

	/**
	 * 게시글 번호로 댓글 목록 조회
	 */
	@Override
	public ArrayList<CommunityReply> selectReplyList(String abNo) {
		
		return aDao.selectReplyList(sqlSession, abNo);
		
	}

	/**
	 *  댓글 등록 시 해당 게시글 댓글 총 개수 증가
	 */
	@Override
	public int insertReply(CommunityReply cr) {
		
		int result1 = aDao.insertReply(sqlSession, cr);
		
		int result2 = aDao.increaseReplyCount(sqlSession, cr);
		
		return result1 * result2;		
		
	}

	/**
	 * 댓글 수정
	 */
	@Override
	public int updateReply(CommunityReply cr) {
		
		return aDao.updateReply(sqlSession, cr);
		
	}

	/**
	 * 댓글 삭제 시 해당 게시글 댓글 총 개수 감소
	 */
	@Override
	public int deleteReply(CommunityReply cr) {
		
		int result1 = aDao.deleteReply(sqlSession, cr);
		
		int result2 = aDao.decreaseReplyCount(sqlSession, cr);
		
		return result1 * result2;
		
	}
	
	/**
	 * 전체 익명 게시글의 게시글 번호 및 사원 번호 목록 조회
	 */
	@Override
	public ArrayList<AnonymousBoard> selectTotalAnonymousBoardList() {
		
		return aDao.selectTotalAnonymousBoardList(sqlSession);
		
	}
	
	/**
	 * 나의 익명 게시글 목록 조회
	 */
	@Override
	public ArrayList<AnonymousBoard> selectMyAnonymousBoardList(PageInfo pi, ArrayList<String> myAbNoList) {
		
		return aDao.selectMyAnonymousBoardList(sqlSession, pi, myAbNoList);
		
	}

}
