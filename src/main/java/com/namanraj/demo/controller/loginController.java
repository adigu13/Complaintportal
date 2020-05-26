package com.namanraj.demo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.namanraj.demo.dao.CompliantRepo;
import com.namanraj.demo.dao.LoginRepo;
import com.namanraj.demo.model.Complaint;
import com.namanraj.demo.model.User;

@RestController
public class loginController 
{
	@Autowired
	private LoginRepo loginrepo;
	
	@Autowired
	private CompliantRepo comprepo;
	
	// SAC Login
	
	@RequestMapping("/saclogin")
	public ModelAndView sac()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("saclogin");
		return mv;
	}
	
	@RequestMapping("/login-sac")
	public ModelAndView loginSac(@ModelAttribute User user , HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		if(loginrepo.findByUsernameAndPassword(user.getUsername(), user.getPassword()) != null) {
			session.setAttribute("username", user.getUsername());
			session.setAttribute("type", "sac");
			mv.setViewName("redirect:/saccomplist");
			return mv;
		}
		else {
			mv.setViewName("saclogin");
			return mv;
		}
		
	}
	
	@GetMapping("/saccomplist")
	public ModelAndView sacCompList(ModelAndView mv)
	{
		mv.setViewName("welcomesac");
		Pageable firstPageWithTenElements = PageRequest.of(0, 10);
		Page<Complaint> list = comprepo.findBySac(firstPageWithTenElements);
		mv.addObject("complaints" , list);
		mv.addObject("currentpage", 1);
		return mv;
	}
	
	// Food Commitee Login
	
	@RequestMapping("/fcomlogin")
	public ModelAndView foodcom()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("foodcomlogin");
		return mv;
	}
	
	@RequestMapping("/login-fcom")
	public ModelAndView loginFoodCom(@ModelAttribute User user , HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		if(loginrepo.findByUsernameAndPassword(user.getUsername(), user.getPassword()) != null) {
			session.setAttribute("username", user.getUsername());
			session.setAttribute("type", "foodcom");
			mv.setViewName("redirect:/fcomplist");
			return mv;
		}
		else {
			mv.setViewName("foodcomlogin");
			return mv;
		}
		
	}
	
	@GetMapping("/fcomplist")
	public ModelAndView foodCompList(ModelAndView mv)
	{
		mv.setViewName("welcomefcom");
		Pageable firstPageWithTenElements = PageRequest.of(0, 10);
		Page<Complaint> list = comprepo.findByFcom(firstPageWithTenElements);
		mv.addObject("complaints" , list);
		mv.addObject("currentpage", 1);
		return mv;
	}
	
	// Warden Login
	
	@RequestMapping("/wardenlogin")
	public ModelAndView warden()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("wardenlogin");
		return mv;
	}
	
	@RequestMapping("/login-warden")
	public ModelAndView loginWarden(@ModelAttribute User user  ,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		if(loginrepo.findByUsernameAndPassword(user.getUsername(), user.getPassword()) != null) {
			session.setAttribute("username", user.getUsername());
			session.setAttribute("type", "warden");
			mv.setViewName("redirect:/wardencomplist");
			return mv;
		}
		else {
			mv.setViewName("wardenlogin");
			return mv;
		}
		
	}
	
	@GetMapping("/wardencomplist")
	public ModelAndView wardenCompList(ModelAndView mv)
	{
		mv.setViewName("welcomewarden");
		return mv;
	}
	
	@GetMapping("/bhaskaracomplist")
	public ModelAndView lilavatiCompList(ModelAndView mv)
	{
		mv.setViewName("bhaskara");
		Pageable firstPageWithTenElements = PageRequest.of(0, 10);
		Page<Complaint> list = comprepo.findByWardenAndMen(firstPageWithTenElements);
		mv.addObject("complaints" , list);
		mv.addObject("currentpage", 1);
		return mv;
	}
	
	@GetMapping("/lilavaticomplist")
	public ModelAndView bhaskaraCompList(ModelAndView mv)
	{
		mv.setViewName("lilavati");
		Pageable firstPageWithTenElements = PageRequest.of(0, 10);
		Page<Complaint> list = comprepo.findByWardenAndWomen(firstPageWithTenElements);
		mv.addObject("complaints" , list);
		mv.addObject("currentpage", 1);
		return mv;
	}
	

	// Sport Commitee Login

	
	@RequestMapping("/sportcomlogin")
	public ModelAndView sports()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sportcomlogin");
		return mv;
	}
	
	@RequestMapping("/login-sportscom")
	public ModelAndView loginSportcom(@ModelAttribute User user , HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		if(loginrepo.findByUsernameAndPassword(user.getUsername(), user.getPassword()) != null) {
			session.setAttribute("username", user.getUsername());
			session.setAttribute("type", "sportscom");
			mv.setViewName("redirect:/sportscomplist");
			return mv;
		}
		else {
			mv.setViewName("sportcomlogin");
			return mv;
		}
		
	}
	
	@GetMapping("/sportscomplist")
	public ModelAndView sportsCompList(ModelAndView mv)
	{
		mv.setViewName("welcomesportcom");
		Pageable firstPageWithTenElements = PageRequest.of(0, 10);
		Page<Complaint> list = comprepo.findByScom(firstPageWithTenElements);
		mv.addObject("complaints" , list);
		mv.addObject("currentpage", 1);
		return mv;
	}
	
	
	
	// Internet Commitee Login

	@RequestMapping("/netcomlogin")
	public ModelAndView internet()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("netcomlogin");
		return mv;
	}
	
	@RequestMapping("/login-netcom")
	public ModelAndView loginNetcom(@ModelAttribute User user , HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		if(loginrepo.findByUsernameAndPassword(user.getUsername(), user.getPassword()) != null) {
			session.setAttribute("username", user.getUsername());
			session.setAttribute("type", "intercom");
			mv.setViewName("redirect:/netcomplist");
			return mv;
		}
		else {
			mv.setViewName("netcomlogin.jsp");
			return mv;
		}
		
	}
	
	@GetMapping("/netcomplist")
	public ModelAndView NetCompList(ModelAndView mv)
	{
		mv.setViewName("welcomeNetcom");
		Pageable firstPageWithTenElements = PageRequest.of(0, 10);
		Page<Complaint> list = comprepo.findByNetcom(firstPageWithTenElements);
		mv.addObject("complaints" , list);
		mv.addObject("currentpage", 1);
		return mv;
	}
	
	
	
	
/*------  Foodcom Logout -----*/
	
	@GetMapping("/fcomlogout")
	public void foodcomLogout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("/fcomlogin");
	}
	
	/*------  Sac Logout -----*/
	
	@GetMapping("/saclogout")
	public void sacLogout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("/saclogin");
	}
	
	/*------  Warden Logout -----*/
	
	@GetMapping("/wardenlogout")
	public void wardenLogout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("/wardenlogin");
	}
	
	/*------  Sportscom Logout -----*/
	
	@GetMapping("/sportcomlogout")
	public void sportcomLogout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("/sportcomlogin");
	}
	
	/*------  Netcom Logout -----*/
	
	@GetMapping("/netcomlogout")
	public void netcomLogout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("/netcomlogin");
	}

	
	
	
	
	
	
	
	
	

	/*------  About Us   ----*/

	@RequestMapping("/aboutUs")
	public ModelAndView aboutUs()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("aboutUs.jsp");
		return mv;
	}
	
	/*------  Feedback -----*/
	
	@RequestMapping("/feedback")
	public ModelAndView feedback()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("feedback");
		return mv;
	}


}
