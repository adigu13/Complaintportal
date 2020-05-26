package com.namanraj.demo.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.namanraj.demo.model.Student;

@Service
public class NotificationService
{
	private JavaMailSender javaMailSender;
	
	@Autowired
	public NotificationService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public String sendNotification(Student student) throws MailException{
		SimpleMailMessage mail = new SimpleMailMessage();
		String password = passwordGenerator();
		mail.setTo(student.getEmail());
		mail.setFrom("amang8100@gmail.com");
		mail.setSubject("Complaint Portal Password");
		mail.setText("Hi " + student.getRoll() + ", Your password is: " +"<b>"+ password + ". " + "</b>" + "You can change"
				     + " your password by clicking on this link http://localhost:8083/change ");
		
		javaMailSender.send(mail);
		
		return password;
	}
	
	public void sendStatusNotification(Student student,String status,String title) throws MailException{
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setTo(student.getEmail());
		mail.setFrom("mosipsingh@gmail.com");
		mail.setSubject("Status has been updated");
		mail.setText("Hi "+student.getName()+" The status of your complaint titled "+title+" has been updated to: "+status);
		javaMailSender.send(mail); 
	}
	public String passwordGenerator() {
		String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
        String Small_chars = "abcdefghijklmnopqrstuvwxyz"; 
        String numbers = "0123456789"; 
  
        String values = Capital_chars + Small_chars + numbers; 
        Random rand = new Random(); 
        
        int len  = 6;
        String password = ""; 
  
        for (int i = 0; i < len; i++){ 
            password += values.charAt(rand.nextInt(values.length())); 
  
        } 
        return password;
	}

}
