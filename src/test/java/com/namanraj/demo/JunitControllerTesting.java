package com.namanraj.demo;

import com.namanraj.demo.controller.PageController;
import com.namanraj.demo.controller.StudentController;
import com.namanraj.demo.controller.loginController;
import com.namanraj.demo.controller.complaintController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@RunWith(SpringRunner.class)
public class JunitControllerTesting {
	
	@Autowired
	complaintController complaintController;
	
	@Test
	public void testComplaintControllerInitialization()	{
		assertThat(complaintController).isNotNull();
	}

	@Autowired
	loginController loginController;

	@Test
	public void testloginControllerInitialization()	{
		assertThat(loginController).isNotNull();
	}

	@Autowired
	PageController pageController;

	@Test
	public void testpageControllerInitialization()	{
		assertThat(pageController).isNotNull();
	}

	@Autowired
	StudentController studentController;

	@Test
	public void teststudentControllerInitialization()	{
		assertThat(studentController).isNotNull();
	}
}
