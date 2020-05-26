package com.namanraj.demo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.namanraj.demo.dao.CompliantRepo;
import com.namanraj.demo.dao.StudentRepo;
import com.namanraj.demo.model.Complaint;
import com.namanraj.demo.model.Student;
import com.namanraj.demo.model.Suggestion;
import com.namanraj.demo.service.NotificationService;

@RestController
public class complaintController 
{
	@Autowired
	CompliantRepo repo;
	
	@Autowired
	StudentRepo studentrepo;
	
	@Autowired
	NotificationService notificationservice;
	
	 @Autowired
	private RestHighLevelClient client;
	
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping("/addComplaint")
	public ModelAndView complaint(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("complaint");
		return mv;
	}
	
	  @PostMapping("/autosearch")
	    public List<Suggestion> search(@RequestBody String query) throws IOException {
	      //  System.out.println(query);
	    	List<Suggestion> suggestions = new ArrayList<>();
	        QueryBuilder matchQueryBuilder = QueryBuilders.matchPhraseQuery("title", query);
	        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
	        sourceBuilder.query(matchQueryBuilder);
	        sourceBuilder.from(0);
	        sourceBuilder.size(7);
	        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));

	        SearchRequest searchRequest = new SearchRequest("complaints");
	        searchRequest.source(sourceBuilder);

	        SearchResponse searchResponse = client.search(searchRequest,RequestOptions.DEFAULT);
	        for(SearchHit searchHit : searchResponse.getHits().getHits()){
	        	Suggestion com = new ObjectMapper().readValue(searchHit.getSourceAsString(),Suggestion.class);
	        	suggestions.add(com);
	        }
	     //  System.out.println(suggestions.size());
	        return suggestions;
	    }	
	
	
	/* -------  Add Complaint -----------*/
	
	@PostMapping(value="/success" , consumes = {"application/x-www-form-urlencoded"})
	//@JsonFormat(shape=JsonFormat.Shape.ARRAY)

	public ModelAndView addComplaint(@RequestParam("ctype") String ctype ,
			@RequestParam("comptitle") String comptitle,
			@RequestParam("compbody") String compbody , HttpSession session) 
			throws IOException
	{
		ModelAndView mv = new ModelAndView();
		String roll = (String) session.getAttribute("username");
		Student student = studentrepo.findByRoll(roll);
		Complaint complaint  = new Complaint(0, roll, student.getName(), student.getHostel(),
				student.getRoom(), ctype, comptitle,compbody, "Pending", "No message", sdf.format(new Date(System.currentTimeMillis())));
		Complaint savedObj = repo.save(complaint);	
		
//		UUID uuid = UUID.randomUUID();
		Suggestion suggestion = new Suggestion(savedObj.getId()+"",comptitle,compbody);
		IndexRequest request = new IndexRequest("complaints");
        request.id(suggestion.getId());
       
        request.source(new ObjectMapper().writeValueAsString(suggestion), XContentType.JSON);
        IndexResponse indexResponse = client.index(request, RequestOptions.DEFAULT);
        System.out.println("response id: "+indexResponse.getId());
       
		
		
//		mv.setViewName("compconfirmation.jsp");
//		mv.addObject("complaint" , complaint);
     //   session.setAttribute("username", roll);
		mv.setViewName("redirect:/student/"+roll);
	//	return mv;
        return mv;
		
	}
	
	/*-------  Find All Complaints of a Student ------*/
	
//	@GetMapping(path="/complaints")
//	public ModelAndView complaints() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("complaints.jsp");
//		return mv;
//	}
//	
//	@RequestMapping(value="/getComplaints" , method = RequestMethod.POST)
//	public ModelAndView getComplaints(@RequestParam("roll") String roll , @RequestParam("password") String password) {
//		ModelAndView mv = new ModelAndView();
//		if(studentrepo.findByRollAndPassword(roll, password) != null) {
//			mv.setViewName("viewcomplaints.jsp");
//			List<Complaint> list = (List<Complaint>)repo.findByRoll(roll);
//			mv.addObject("complaints" , list);
//			return mv;
//		}
//		else {
//			mv.setViewName("redirect:/complaints");
//			return mv;
//		}
//	}
//	
	/*--------- View and add status in Food Complaint ---------------*/
	
	@GetMapping("/foodcomplaint/{compid}")
	//@ResponseBody
	public ModelAndView foodComplaint(@PathVariable("compid") int compid) {
		
		Complaint complaint = repo.findById(compid).orElse(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewComplaint");
		mv.addObject("complaint" , complaint);
		return mv;
	}
	
	@GetMapping("foodcomplaint/view/{comproll}/{compid}")
	//@ResponseBody
	public ModelAndView updateFoodComplaint(@PathVariable("compid") int compid ,@PathVariable("comproll") String comproll, @RequestParam("status") String status ,
			@RequestParam("message") String message , @RequestParam("comptitle") String title) {
		//System.out.println("title--"+title); 
		int id = repo.updateComplaint(status , message , compid);
		//System.out.println("send mail---"+comproll);
		Student student = studentrepo.findByRoll(comproll);
		notificationservice.sendStatusNotification(student, status,title); 
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/fcomplist");
		return mv;
	}
	
	/*--------- View and add status in Sac Complaint ---------------*/

	
	@GetMapping("/saccomplaint/{compid}")
	//@ResponseBody
	public ModelAndView sacComplaint(@PathVariable("compid") int compid) {

		Complaint complaint = repo.findById(compid).orElse(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sacComplaint");
		mv.addObject("complaint" , complaint);
		return mv;
	}
	
	@GetMapping("saccomplaint/view/{comproll}/{compid}")
	//@ResponseBody
	public ModelAndView updateSacComplaint(@PathVariable("compid") int compid ,@PathVariable("comproll") String comproll, @RequestParam("status") String status ,
			@RequestParam("message") String message ,@RequestParam("comptitle") String title) {

		int id = repo.updateComplaint(status , message , compid);
		Student student = studentrepo.findByRoll(comproll);
		notificationservice.sendStatusNotification(student, status,title);
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/saccomplist");
		return mv;
	}
	
	/*--------- View and add status in Warden Complaint ---------------*/

	
	@GetMapping("/wardencomplaint/{compid}")
	//@ResponseBody
	public ModelAndView wardenComplaint(@PathVariable("compid") int compid) {

		Complaint complaint = repo.findById(compid).orElse(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("wardenComplaint");
		mv.addObject("complaint" , complaint);
		return mv;
	}
	
	@GetMapping("wardencomplaint/view/{comproll}/{compid}")
	//@ResponseBody
	public ModelAndView updateWardenComplaint(@PathVariable("compid") int compid , @PathVariable("comproll") String comproll , @RequestParam("status") String status ,
			@RequestParam("message") String message, @RequestParam("comptitle") String title) {

		int id = repo.updateComplaint(status , message , compid);
		Student student = studentrepo.findByRoll(comproll);
		notificationservice.sendStatusNotification(student, status, title);
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/wardencomplist");
		return mv;
	}
	
	/*--------- View and add status in Sports Complaint ---------------*/

	
	@GetMapping("/sportcomplaint/{compid}")
	//@ResponseBody
	public ModelAndView sportComplaint(@PathVariable("compid") int compid) {

		Complaint complaint = repo.findById(compid).orElse(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sportComplaint");
		mv.addObject("complaint" , complaint);
		return mv;
	}
	
	@GetMapping("sportcomplaint/view/{comproll}/{compid}")
	//@ResponseBody
	public ModelAndView updateSportComplaint(@PathVariable("compid") int compid ,@PathVariable("comproll") String comproll, @RequestParam("status") String status ,
			@RequestParam("message") String message, @RequestParam("comptitle") String title) {

		int id = repo.updateComplaint(status , message , compid);
		Student student = studentrepo.findByRoll(comproll);
		notificationservice.sendStatusNotification(student, status, title);
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/sportscomplist");
		return mv;
	}
	
	
/*--------- View and add status in Internet Complaint ---------------*/

	
	@GetMapping("/netcomplaint/{compid}")
	public ModelAndView NetComplaint(@PathVariable("compid") int compid) {

		Complaint complaint = repo.findById(compid).orElse(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("netComplaint");
		mv.addObject("complaint" , complaint);
		return mv;
	}
	
	@GetMapping("netcomplaint/view/{comproll}/{compid}")
	public ModelAndView updateNetComplaint(@PathVariable("compid") int compid , @PathVariable("comproll") String comproll ,@RequestParam("status") String status ,
			@RequestParam("message") String message, @RequestParam("comptitle") String title) {

		int id = repo.updateComplaint(status , message , compid);
		Student student = studentrepo.findByRoll(comproll);
		notificationservice.sendStatusNotification(student, status, title);
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/netcomplist");
		return mv;
	}
	
	
	
	
	
	/*---------  Track Status  -------------*/
	@GetMapping("/trackstatus")
	public ModelAndView status() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trackstatus");
		return mv;
	}
	
	@GetMapping("/status")
	public ModelAndView trackStatus(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Complaint getStatus = repo.findById(id).orElse(null);
		if(getStatus == null) {
			mv.setViewName("error");
			String error = "Id Not found";
			mv.addObject("error" , error);
			return mv;
		}
		else {
			mv.setViewName("viewstatus");
			mv.addObject("getStatus" , getStatus);
			return mv;
		}
		
		
	}
	

	
	
}	

	