package com.panda.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.panda.domain.MemberVO;
import com.panda.service.MyPageService;

@Controller
@RequestMapping(value = "/myinfo/*")
public class MyInfoContoroller {
	
	
	private static final Logger mylog = LoggerFactory.getLogger(MyInfoContoroller.class);

	
	@Inject
	private MyPageService myservice;
	
	// http://localhost:8080/myinfo/myinfo
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String mainGET(HttpSession session, Model model, MemberVO memberVO) throws Exception {
//		 로그인 제어	
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id == null) {
			return "redirect:/main/index";
		}
		
		
		
		
		memberVO.setUser_id(user_id);
		memberVO = myservice.getMembers(memberVO);
		
		model.addAttribute("memberVO", memberVO);
		

		return "/myinfo/myinfo";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String updatemyp(MemberVO memberVO) throws Exception{

		myservice.modify(memberVO);
		mylog.debug(" updatemyp() 호출 수정후 정보 : "+myservice.getMembers(memberVO)); 
			
		return "redirect:/myinfo/myinfo";

	}

}
