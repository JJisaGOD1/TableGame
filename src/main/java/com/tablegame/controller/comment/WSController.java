package com.tablegame.controller.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.tablegame.dto.Message;
import com.tablegame.service.comment.WSService;

@RestController
public class WSController {
	
	@Autowired
	private WSService service;
	
	//Postman送方法
	@PostMapping(value = "/send-message")
	public void sendMessage(@RequestBody Message message) {
		service.notifyFront(message.getMessageContent());
	}
	
	//Postman送方法
	@PostMapping(value = "/send-private-message/{id}")
	public void sendPrivateMessage(@PathVariable String id, 
								@RequestBody Message message) {
		service.notifyUser(id, message.getMessageContent());
		
	}
}
