package com.ezen.myproject.controller;

import javax.inject.Inject;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.myproject.domain.MemberVO;
import com.ezen.myproject.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Inject
	private MemberService msv;
	
	@GetMapping("/signUp")
	public String signUpGet() {
		return "/member/signUp";
	}
	
	@PostMapping("/signUp")
	public String signUpPost(MemberVO mvo) {
		int isOk = msv.insert(mvo);
		return "index";
	}
	
	@GetMapping("/login")
	public String loginGet() {
		
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String loginPost(MemberVO mvo, HttpServletRequest req, Model m) {
		MemberVO loginVO = msv.login(mvo);
		if(loginVO != null) {
			HttpSession ses = req.getSession();
			ses.setAttribute("ses", loginVO);
			ses.setMaxInactiveInterval(60*10);
		}else {
			m.addAttribute("no", 1);
		}
		return "index";
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest req, Model m) {
		req.getSession().removeAttribute("ses"); //세션 객체 삭제
		req.getSession().invalidate();
		m.addAttribute("logout", 1);
		return "index";
	}
	
	@GetMapping("/modify")
	public String modifyGet() {
		return "/member/modify";
	}
	
	@PostMapping("/modify")
	public String modifyPost(MemberVO mvo,RedirectAttributes re) {
		int isOk = msv.modify(mvo);
		return "redirect:/member/logout";
	}
}
