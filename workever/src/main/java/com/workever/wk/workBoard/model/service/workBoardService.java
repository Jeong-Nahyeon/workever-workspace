package com.workever.wk.workBoard.model.service;

import java.util.ArrayList;

import com.workever.wk.project.model.vo.Project;
import com.workever.wk.workBoard.model.vo.Reply;
import com.workever.wk.workBoard.model.vo.workBoard;

public interface workBoardService {
	
		// 2. 게시글 작성하기 서비스
		int insertBoard(workBoard wb);
		
		// 3. 게시글 상세조회용 서비스
		int increaseCount(int boardNo);
		workBoard selectBoard(int boardNo);
		
		// 4. 게시글 삭제용 서비스
		int deleteBoard(int boardNo);
		
		// 5. 게시글 수정용 서비스
		int updateBoard(workBoard wb);
		
		// 6. 댓글 리스트 조회용 서비스 (ajax)
		ArrayList <Reply> selectReplyList(int boardNo);
		
		// 7. 댓글 작성용 서비스 (ajax)
		int insertReply(Reply r);

		// 첨부파일 입력
		int insertAttachment(workBoard wb);
		
}
