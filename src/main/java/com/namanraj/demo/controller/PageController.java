package com.namanraj.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.namanraj.demo.dao.CompliantRepo;
import com.namanraj.demo.model.Complaint;

@Controller
public class PageController {
	
	@Autowired
	CompliantRepo repo;
	
	
	@GetMapping("/pages/{pageNo}")
    public String getPaginatedComplaints(Model model, @PathVariable int pageNo, HttpSession session) {
		Pageable pageWithTenElements = PageRequest.of(pageNo, 10);
		Page<Complaint> list = repo.findByRollOrderByTimestampDesc(session.getAttribute("username").toString(), pageWithTenElements);
		model.addAttribute("complaints" ,list);
		model.addAttribute("currentpage",pageNo+1);
		return "welcomestudent";
		
		
    }
	
	@GetMapping("/sportcom/{pageNo}")
    public String getPaginatedSportsComplaints(Model model, @PathVariable int pageNo) {
		Pageable pageWithTenElements = PageRequest.of(pageNo, 10);
		Page<Complaint> list = repo.findByScom(pageWithTenElements);
		model.addAttribute("complaints" ,list);
		model.addAttribute("currentpage",pageNo+1);
		return "welcomesportcom";
		
		
    }
	@GetMapping("/netcom/{pageNo}")
    public String getPaginatedNetComplaints(Model model, @PathVariable int pageNo) {
		Pageable pageWithTenElements = PageRequest.of(pageNo, 10);
		Page<Complaint> list = repo.findByNetcom(pageWithTenElements);
		model.addAttribute("complaints" ,list);
		model.addAttribute("currentpage",pageNo+1);
		return "welcomeNetcom";
		
		
    }
	@GetMapping("/foodcom/{pageNo}")
    public String getPaginatedFoodComplaints(Model model, @PathVariable int pageNo) {
		Pageable pageWithTenElements = PageRequest.of(pageNo, 10);
		Page<Complaint> list = repo.findByFcom(pageWithTenElements);
		model.addAttribute("complaints" ,list);
		model.addAttribute("currentpage",pageNo+1);
		return "welcomefcom";
		
		
    }
	@GetMapping("/saccom/{pageNo}")
    public String getPaginatedSacComplaints(Model model, @PathVariable int pageNo) {
		Pageable pageWithTenElements = PageRequest.of(pageNo, 10);
		Page<Complaint> list = repo.findBySac(pageWithTenElements);
		model.addAttribute("complaints" ,list);
		model.addAttribute("currentpage",pageNo+1);
		return "welcomesac";
		
		
    }
	@GetMapping("/menhostelcom/{pageNo}")
    public String getPaginatedMenHostekComplaints(Model model, @PathVariable int pageNo) {
		Pageable pageWithTenElements = PageRequest.of(pageNo, 10);
		Page<Complaint> list = repo.findByWardenAndMen(pageWithTenElements);
		model.addAttribute("complaints" ,list);
		model.addAttribute("currentpage",pageNo+1);
		return "bhaskara";
		
		
    }
	@GetMapping("/womenhostelcom/{pageNo}")
    public String getPaginatedWomenHostekComplaints(Model model, @PathVariable int pageNo) {
		Pageable pageWithTenElements = PageRequest.of(pageNo, 10);
		Page<Complaint> list = repo.findByWardenAndWomen(pageWithTenElements);
		model.addAttribute("complaints" ,list);
		model.addAttribute("currentpage",pageNo+1);
		return "lilavati";
		
		
    }
}
