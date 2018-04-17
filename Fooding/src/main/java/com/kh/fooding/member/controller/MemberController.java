package com.kh.fooding.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.kh.fooding.member.model.exception.LoginException;
import com.kh.fooding.member.model.service.MemberService;
import com.kh.fooding.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	/*@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String loginCheck(Member m , HttpSession session, Model model) {

		System.out.println("controller Member : " + m);

		try { 
			Member loginUser = ms.loginMember(m);

			session.setAttribute("loginUser", loginUser);

			return "main/main";

		} catch (LoginException e) {
			model.addAttribute("message", e.getMessage());
			return "common/errorPage";
		}
	}*/
	
	//로그인
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public ModelAndView loginCheck(Member m,Model model, ModelAndView mv, SessionStatus status) {

		System.out.println("controller Member : " + m);

		try {
			Member loginUser = ms.loginMember(m);

			mv.addObject("loginUser", loginUser);
			model.addAttribute("loginUser",loginUser);
			status.setComplete();
			
			mv.setViewName("main/main");

		} catch (LoginException e) {
			String loginFail = "로그인에 실패하였습니다.";
			mv.addObject("loginFail", loginFail);
			mv.setViewName("main/main");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "goMemberJoin.me")
	public String goMemberJoin() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value = "goStoreJoin.me")
	public String goStoreJoin() {
		
		return "member/storeJoin";
	}
	 
	@RequestMapping(value ="memberJoin.me")
	public String memberJoin(Member m, Model model) {
		
		m.setUserPwd(passwordEncoder.encode(m.getUserPwd()));
		
		String[] birthArr = m.getBirth().split(",");
		String birth = birthArr[0] + "년 " + birthArr[1] + "월 " + birthArr[2] + "일"; 
		m.setBirth(birth);
		
		System.out.println("controller m : " + m );
		
		ms.insertMember(m);
		
		return "main/main";
	}
	
	@RequestMapping(value = "logout.me", method = RequestMethod.GET)
	public String logout(/*HttpSession session,*/SessionStatus status) {
		
		//session.invalidate();
		
		status.setComplete();
		
		return "main/main";
	}
	
	@RequestMapping(value ="goMain.me")
	public String goMain() {
		
		return "main/main";
	}
	
}