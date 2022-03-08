package com.tablegame.controller.comment;

import java.security.Principal;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.tablegame.dto.Message;
import com.tablegame.dto.ResponseMessage;

@Controller
public class MessageController {
	
	//會員訊息傳輸
	@MessageMapping(value = "/customerMessage")
	@SendTo("/topic/messages")
	public ResponseMessage getCustomerMessage(Message message) throws InterruptedException {
		return new ResponseMessage(HtmlUtils.htmlEscape(message.getUserId()+" : "+message.getMessageContent()));
		
	}
	
	//Server訊息傳輸
	@MessageMapping(value = "/serverMessage")
	@SendTo("/topic/messages")
	public ResponseMessage getServerMessage(Message message) throws InterruptedException {	
		return new ResponseMessage(HtmlUtils.htmlEscape("Server : "+message.getMessageContent()));
		
	}
	
	//私人訊息，尚未用到
	@MessageMapping(value = "/private/message")
	@SendToUser("/topic/private-messages")
	public ResponseMessage getPrivateMessage(Message message, Principal principal) throws InterruptedException {
		Thread.sleep(1000);
		return new ResponseMessage(HtmlUtils.htmlEscape(
				"Sending private message to user " + principal.getName() + ":" + message.getMessageContent()));
	}
}
