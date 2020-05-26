package com.namanraj.demo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.namanraj.demo.dao.CompliantRepo;
import com.namanraj.demo.dao.StudentRepo;
import com.namanraj.demo.model.Complaint;
import com.namanraj.demo.model.Student;
import com.namanraj.demo.service.NotificationService;

@RestController
public class StudentController 
{
	@Autowired
	StudentRepo studentrepo;
	
	@Autowired
	NotificationService notificationservice;
	
	@Autowired
	CompliantRepo comprepo;
	
	@RequestMapping("/register")
	public ModelAndView registerStudent() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
	
	@RequestMapping("/register-success")
	public ModelAndView registerSuccess(Student student) {
		ModelAndView mv = new ModelAndView();
		try {
			studentrepo.save(student);
		}
		catch(Exception e) {
			mv.setViewName("redirect:/register");
			return mv;
		}
		String email = student.getEmail();
		if(email.endsWith("@iiitb.org")) {
			if(studentrepo.findByRollAndRoom(student.getRoll(), student.getRoom()) != null) {
				try{
					String password = notificationservice.sendNotification(student);
					studentrepo.updateStudent(password, student.getEmail() , student.getName() , student.getRoll());
					mv.setViewName("registrationsuccess");
					mv.addObject("roll" , student.getRoll());
				}
				catch(MailException e) {
					System.out.println(e);
				}
				return mv;
			}
			else{
				mv.setViewName("redirect:/register");
				return mv;
			}
		}
		else{
			mv.setViewName("redirect:/register");
			return mv;
		}
		
	}
	
	@RequestMapping("/change")
	public ModelAndView change() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/changepassword");
		return mv;
	}
	
	@RequestMapping("/changepassword")
	public ModelAndView changePassword(@RequestParam("roll") String roll , @RequestParam("oldpass") String oldpass,
								 @RequestParam("newpass") String newpass) {
		
		ModelAndView mv = new ModelAndView();
		Student student = studentrepo.findByRoll(roll);
		if(student.getPassword().equals(oldpass)) {
			studentrepo.updatePassword(newpass, roll);
			mv.setViewName("redirect:/");
			return mv;
		}
		else {
			mv.setViewName("redirect:/changepassword");
			return mv;
		}
		
	}
	
	@RequestMapping("/forgot")
	public ModelAndView forgot() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/forgotpassword");
		return mv;
	}
	
	@RequestMapping("/forgotpassword")
	public ModelAndView forgotPassword(@RequestParam("roll") String roll) {
		ModelAndView mv = new ModelAndView();
		if(studentrepo.findByRoll(roll) != null) {
			Student student = studentrepo.findByRoll(roll);
			try{
				String password = notificationservice.sendNotification(student);
				studentrepo.updatePassword(password, roll);
				mv.setViewName("registrationsuccess");
				mv.addObject("roll" , student.getRoll());
			}
			catch(MailException e) {
				System.out.println(e);
			}
			return mv;
		}
		else{
			mv.setViewName("redirect:/register");
			return mv;
		}
	}
	
	@RequestMapping("/studentlogin")
	public ModelAndView studentLogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentlogin");
		return mv;
	}
	
	@RequestMapping(value = "/login-student" , method = RequestMethod.POST)
	public ModelAndView loginStudent(@RequestParam("roll") String roll , @RequestParam("password") String password ,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		Student student = studentrepo.findByRollAndPassword(roll, password);
		if(student != null) {
			session.setAttribute("username", roll);
			session.setAttribute("name", student.getName());
			session.setAttribute("type", "student");
			mv.setViewName("redirect:/student/"+roll);
			return mv;
		}
		else {
		
			mv.setViewName("redirect:/studentlogin");
			return mv;
		}
		
	}
	
	
	@RequestMapping("/student/{roll}")
	public ModelAndView studentDashboard(@PathVariable("roll") String roll , HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		try{if((boolean)session.getAttribute("username").equals(roll)) {
			//System.out.println(session.getAttribute("username"));
			mv.setViewName("welcomestudent");
			Pageable firstPageWithTenElements = PageRequest.of(0, 10);
			Page<Complaint> list =(Page<Complaint>) comprepo.findByRollOrderByTimestampDesc(roll,firstPageWithTenElements);
			//System.out.println(list.getNumberOfElements());
			//System.out.println(list.getTotalPages());
			//System.out.println(list.getTotalElements());
			mv.addObject("complaints" ,list);
			mv.addObject("currentpage",1);
			return mv;
		}
		else {
			mv.setViewName("redirect:/studentlogin");
			return mv;
		}
		}catch(NullPointerException e) {
			mv.setViewName("redirect:/studentlogin");
			return mv;
		}
		
	}
	
	
	
	@GetMapping("/studentlogout")
	public void studentLogout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("/studentlogin");
	}
}
