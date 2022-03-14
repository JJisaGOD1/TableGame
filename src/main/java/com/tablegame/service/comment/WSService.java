package com.tablegame.service.comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.tablegame.dto.ResponseMessage;

@Service
public class WSService {
	
	@Autowired
	private SimpMessagingTemplate messagingTemplate;

	public void notifyFront(String message) {
		ResponseMessage response = new ResponseMessage(message);
		
		messagingTemplate.convertAndSend("/topic/messages", response);
		
	}
	
	public void notifyUser(String id, String message) {
		String newMessage = "Server 私訊 : "+message;
		
		ResponseMessage response = new ResponseMessage(newMessage);
		
		messagingTemplate.convertAndSendToUser(id,"/topic/private-messages", response);
	}

}

	