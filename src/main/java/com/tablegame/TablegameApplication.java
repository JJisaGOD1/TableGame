package com.tablegame;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class TablegameApplication {

	public static void main(String[] args) {
		SpringApplication.run(TablegameApplication.class, args);
		System.out.println("小組公用桌遊專案!!");
	}

}
