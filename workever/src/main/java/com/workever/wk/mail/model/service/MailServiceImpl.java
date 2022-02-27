package com.workever.wk.mail.model.service;

import java.util.ArrayList;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.core.io.FileSystemResource;
import java.io.File;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.mail.model.dao.MailDao;
import com.workever.wk.mail.model.vo.Mail;
import com.workever.wk.mail.model.vo.MailFiles;
import com.workever.wk.user.model.vo.User;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	// 메일 작성

	/**
	 * 사원 목록 조회(주소록)
	 */
	@Override
	public ArrayList<User> autoSearch(HashMap<String, String> map) {
		
		return mDao.autoSearch(sqlSession, map);
		
	}
	
	/**
	 * 수신/참조 메일 대상 사원의 이메일 조회
	 */
	@Override
	public String selectMailReceiver(String userNo) {
		
		return mDao.selectMailReceiver(sqlSession, userNo);
		
	}
	
	
	
	// 메일 발송
	
	/**
	 * 사내메일
	 */
	@Override
	public int sendMail(Mail mail, ArrayList<Mail> intList, ArrayList<MailFiles> fileList) {
		
		int result1 = mDao.insertMsMail(sqlSession, mail); // 발신자 보낸메일
		
		int result2 = 1;
		if(!fileList.isEmpty()) {
			
			for(MailFiles mf : fileList) {
				
				result2 = mDao.insertFile(sqlSession, mf); // 첨부파일
			
			}
			
		}
		
		int result3 = 0;
		for(Mail rm : intList) {
			
			if(rm.getMrCc() != null) {
				
				result3 = mDao.insertCcMail(sqlSession, rm); // 수신자 참조메일
				
			} else {
				
				result3 = mDao.insertMrMail(sqlSession, rm); // 수신자 받은메일
				
			}
			
		}
		System.out.println("result1 : " + result1);
		System.out.println("result2 : " + result2);
		System.out.println("result3 : " + result3);
		return result1 * result2 * result3;
		
	}
	
	/**
	 * 외부메일
	 */
	@Override
	public int sendExtMail(HttpSession session, ArrayList<Mail> extList, ArrayList<MailFiles> fileList) {
				
		MimeMessagePreparator[] preparators = new MimeMessagePreparator[extList.size()]; 

		int i = 0; 
		
		for(Mail extMail : extList) { 
			
			String title = extMail.getMsTitle();
			String content = extMail.getMsContent();
			String address = extMail.getMsSender();
			String to = extMail.getMrReceiver();
			
			String comName = extMail.getComName();
			String deptName = extMail.getMsDeptName();
			String rank = extMail.getMsUserRank();
			String name = extMail.getMsUserName();
			
			
			preparators[i++] = new MimeMessagePreparator() { 
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception { 
					
					String senderName = comName + " ";
					
					if(! deptName.equals("임원")) {
						
						senderName += deptName + " ";
						
					} 
					
					senderName += rank + " " + name;
					
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
					
					helper.setSubject(title);
					helper.setText(content, true);
					helper.setFrom(address, senderName);
					
			        if(extMail.getMrCc() != null && extMail.getMrCc().equals("Y")) { // 참조자인 경우
			        	
			        	helper.setCc(to);
			        	
			        } else {
			        	
			        	helper.setTo(to);
			        	
			        }
			        
			        
			        if(!fileList.isEmpty()) {
			        	
			        	for(MailFiles mf : fileList) {
			        		
			        		FileSystemResource file = new FileSystemResource(new File(session.getServletContext().getRealPath(mf.getMfPath() + mf.getMfChangeName()))); 
			        		helper.addAttachment(MimeUtility.encodeText(mf.getMfOriginName(),"UTF-8", "B"), file);
			        	
			        	}
			            
			        }
				
				}
				
			};
			
		 } 
		
		mailSender.send(preparators);
		
		return 1;
		
	}

	
	
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
