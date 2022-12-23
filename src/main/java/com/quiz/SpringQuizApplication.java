package com.quiz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//임시로 DB설정을 안볼 때
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})


@SpringBootApplication
public class SpringQuizApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringQuizApplication.class, args);
	}

}
