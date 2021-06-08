package com.cyco.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cyco.member.dao.MemberDao;

@RestController
public class RegisterRestComtroller {
	
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="emailcheckajax.cy", method=RequestMethod.GET)
	public String checkEmail(String email) {
		
		System.out.println("This is checkEmail");
		String mail = email.replace("email=","").replace("%40","@");
		
		System.out.println(" : " + mail );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkEmail(mail) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("寃곌낵媛� : " + result);
		
		return result;
	}
	
	@RequestMapping(value="emailcheckajax.cy", method=RequestMethod.POST)
	public String mailSending(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException {
		 
		System.out.println("�씤利앸찓�씪 諛쒖넚 而⑦듃濡ㅻ윭");
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //�씠硫붿씪濡� 諛쏅뒗 �씤利앹퐫�뱶 遺�遺� (�궃�닔)
        
        String setfrom = "mnd3259@gmail.com";
        String tomail = request.getParameter("email"); // 諛쏅뒗 �궗�엺 �씠硫붿씪
        String title = "[CYCODING]�궗�씠醫뗪쾶 肄붾뵫�븯�옄 �궗�씠肄붾뵫 �씤利� 硫붿씪�엯�땲�떎"; // �젣紐�
        String content =
        
        System.getProperty("line.separator")+ //�븳以꾩뵫 以꾧컙寃⑹쓣 �몢湲곗쐞�빐 �옉�꽦        
        System.getProperty("line.separator")+
                
        "�븞�뀞�븯�꽭�슂 �쉶�썝�떂!" +
        System.getProperty("line.separator")+ 
        "CYCODING�뿉 媛��엯�븯湲� �쐞�빐 �븘�옒 �씤利앸쾲�샇瑜� �엯�젰�빐二쇱꽭�슂"
        
        +System.getProperty("line.separator")+        
        System.getProperty("line.separator")+

        "[ " +dice+ " ]"
        
        +System.getProperty("line.separator")+       
        System.getProperty("line.separator")+
        
        "�쐞�쓽 �씤利앸쾲�샇瑜� �쉶�썝媛��엯 李쎌뿉 �엯�젰�븯�떆硫� �떎�쓬 �떒怨꾨줈 吏꾪뻾�씠 媛��뒫�빀�땲�떎." // �궡�슜
        
        +System.getProperty("line.separator")+
        System.getProperty("line.separator")+
        
        "媛먯궗�빀�땲�떎!";
        
        String result = "fail";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 蹂대궡�뒗�궗�엺 �깮�왂�븯硫� �젙�긽�옉�룞�쓣 �븞�븿
            messageHelper.setTo(tomail); // 諛쏅뒗�궗�엺 �씠硫붿씪
            messageHelper.setSubject(title); // 硫붿씪�젣紐⑹� �깮�왂�씠 媛��뒫�븯�떎
            messageHelper.setText(content); // 硫붿씪 �궡�슜
            
            mailSender.send(message);
            
            String number = Integer.toString(dice);
            
            result = "success-" + number;
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        System.out.println(dice);
        
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("dice", dice);
        mav.addObject("result", result);
        
        return result;
        
    }
	
	
	@RequestMapping(value="nicknamecheckajax.cy")
	public String checkNickName(String nickName) {
		
		System.out.println("This is checkNickName");
		
		
		System.out.println("以묐났泥댄겕�븷 �땳�꽕�엫 : " + nickName );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkNickName(nickName) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("寃곌낵媛� : " + result);
		
		return result;
	}
	
	@RequestMapping(value="phonecheckajax.cy")
	public String checkPhone(String phone) {
		
		System.out.println("This is checkPhone");
		
		
		System.out.println("以묐났泥댄겕�븷 踰덊샇 : " + phone );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkPhone(phone) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("寃곌낵媛� : " + result);
		
		return result;
	}
	

}
