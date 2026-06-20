package org.blu3fishez.SimpleDiscordForum;

import org.springframework.boot.SpringApplication;

public class TestSimpleDiscordForumApplication {

	public static void main(String[] args) {
		SpringApplication.from(SimpleDiscordForumApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
