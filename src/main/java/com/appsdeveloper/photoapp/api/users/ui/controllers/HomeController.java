package com.appsdeveloper.photoapp.api.users.ui.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

	@Autowired
	private Environment env;
	
	//@GetMapping("/status/check")
	public String status() {
		return "{status:UP}"+env.getProperty("local.server.port");
	}
}
