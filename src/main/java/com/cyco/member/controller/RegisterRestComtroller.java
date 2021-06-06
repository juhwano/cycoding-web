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
import org.springframework.web.bind.annotation.RequestBody;
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
		
		System.out.println("중복체크할 메일 : " + mail );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkEmail(mail) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("결과값 : " + result);
		
		return result;
	}
	
	@RequestMapping(value="emailcheckajax.cy", method=RequestMethod.POST)
	public String mailSending(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException {
		 
		System.out.println("인증메일 발송 컨트롤러");
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "mnd3259@gmail.com";
        String tomail = request.getParameter("email"); // 받는 사람 이메일
        String title = "[CYCODING]사이좋게 코딩하자 사이코딩 인증 메일입니다"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님!" +
        System.getProperty("line.separator")+ 
        "CYCODING에 가입하기 위해 아래 인증번호를 입력해주세요"
        
        +System.getProperty("line.separator")+        
        System.getProperty("line.separator")+

        "[ " +dice+ " ]"
        
        +System.getProperty("line.separator")+       
        System.getProperty("line.separator")+
        
        "위의 인증번호를 회원가입 창에 입력하시면 다음 단계로 진행이 가능합니다." // 내용
        
        +System.getProperty("line.separator")+
        System.getProperty("line.separator")+
        
        "감사합니다!";
        
        String result = "fail";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
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
		
		
		System.out.println("중복체크할 닉네임 : " + nickName );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkNickName(nickName) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("결과값 : " + result);
		
		return result;
	}
	
	@RequestMapping(value="phonecheckajax.cy")
	public String checkPhone(String phone) {
		
		System.out.println("This is checkPhone");
		
		
		System.out.println("중복체크할 번호 : " + phone );
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		String result = "able";
		
		if(memberdao.checkPhone(phone) != null) {
			result = "disable";
		} else {
			result = "able";
		}
		

		System.out.println("결과값 : " + result);
		
		return result;
	}
	

}
