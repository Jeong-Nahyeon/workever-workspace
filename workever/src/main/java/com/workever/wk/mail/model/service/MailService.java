package com.workever.wk.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.mail.model.vo.Mail;
import com.workever.wk.mail.model.vo.MailFiles;
import com.workever.wk.user.model.vo.User;

public interface MailService {
	
	// 메일 작성
	
	// 이메일 작성 시 자동 완성 검색용
	ArrayList<User> autoSearch(HashMap<String, String> map); // 사원 목록 조회(주소록)
	

	
	// 메일 발송
	String selectMailReceiver(String userNo); // 수신/참조 메일 대상 사원의 이메일 조회
	int sendMail(Mail mail, ArrayList<Mail> intList, ArrayList<MailFiles> fileList); // 사내메일
	int sendExtMail(HttpSession session, ArrayList<Mail> extList, ArrayList<MailFiles> fileList); // 외부메일
	
	
	
	// 받은메일함
	
	// 받은메일함 서비스
	int selectIncomingMailListCount(String mrUserNo); // 받은메일 총 개수
	ArrayList<Mail> selectIncomingMailList(PageInfo pi, String mrUserNo); // 받은메일 목록 조회
	
	// 받은메일 삭제(삭제메일함으로 이동) 서비스
	int deleteTrashIncomingMail(String mrNo); // 받은메일 삭제(삭제메일함으로 이동)
	
	// 메일 읽음/안읽음 처리 서비스
	int updateRead(String mrNo); // 읽음 처리
	int updateNoRead(String mrNo); // 안읽음 처리
	
	// 받은메일 서비스
	Mail selectIncomingMail(Mail m); // 받은메일 상세 조회
	ArrayList<Mail> selectCcList(String msNo); // 참조자 목록 조회
	ArrayList<MailFiles> selectMailFileList(String msNo); // 첨부파일 목록 조회
	
	

	// 보낸메일함
	
	// 보낸메일함 서비스
	int selectOutgoingMailListCount(String msUserNo); // 보낸메일 총 개수
	ArrayList<Mail> selectOutgoingMailList(PageInfo pi, String msUserNo); // 보낸메일 목록 조회
	
	// 보낸메일 삭제 서비스
	int deleteOutgoingMailList(String msNo); // 보낸메일 완전 삭제
	
	// 보낸메일 서비스
	Mail selectOutgoingMail(String msNo); // 보낸메일 상세 조회
	ArrayList<Mail> selectReceiveList(String msNo); // 수신자 목록 조회
	
	
	
	// 삭제메일함
	
	// 삭제메일함 서비스
	int selectTrashMailListCount(String mrUserNo); // 삭제 메일 총 개수
	ArrayList<Mail> selectTrashMailList(PageInfo pi, String mrUserNo); // 삭제메일 목록 조회
	
	// 메일 완전 삭제 서비스
	int deleteIncomingMailList(String mrNo); // 받은메일 완전 삭제
	int selectExistingSenderMailCount(String msNo); // 완전 삭제 안된 발신자 메일 수
	int selectExistingReceiverMailCount(String msNo); // 완전 삭제 안된 수신자/참조자 메일 수
	int deleteMailFileList(String msNo); // 발신자 및 수신자, 참조자 메일 완전 삭제 시 첨부파일 삭제
	int deleteOutGoingMailList(String msNo); // 보낸메일 완전 삭제
	
	// 삭제메일함에서 받은메일함으로 메일 이동 서비스
	int updateToInbox(String mrNo); // 받은메일함으로 메일 이동
	
}
