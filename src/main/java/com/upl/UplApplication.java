package com.upl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
public class UplApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(UplApplication.class, args);
	}

}
