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
	
	//client端送全服
	@MessageMapping(value = "/customerMessage")
	@SendTo("/topic/messages")
	public ResponseMessage getCustomerMessage(Message message) throws InterruptedException {
		return new ResponseMessage(HtmlUtils.htmlEscape(message.getClientName()+" : "+message.getMessageContent()));
		
	}
	
	//server端送全服
	@MessageMapping(value = "/serverMessage")
	@SendTo("/topic/messages")
	public ResponseMessage getServerMessage(Message message) throws InterruptedException {	
		return new ResponseMessage(HtmlUtils.htmlEscape("Server (公頻): "+message.getMessageContent()));
		
	}
	
	//client端私訊server
		@MessageMapping(value = "/private/server/message")
		@SendTo("/topic/server/messages")
		public ResponseMessage getPrivateMessage(Message message, Principal principal) throws InterruptedException {
			Thread.sleep(1000);
			return new ResponseMessage(HtmlUtils.htmlEscape(
					message.getClientName()+" 私訊 : " + message.getMessageContent() 
					+ " (Client-Id : " + principal.getName() + ")"));
	}
	
	
	//client端私訊自端
	@MessageMapping(value = "/private/customer/message")
	@SendToUser("/topic/private-messages")
	public ResponseMessage getPrivateMessageCus(Message message, Principal principal) throws InterruptedException {
		return new ResponseMessage(HtmlUtils.htmlEscape(message.getClientName()+ " 私訊 Server : " + message.getMessageContent()));
	}
	
	//server端ajax傳給client 且server顯示
		@MessageMapping(value = "server/private/message")
		@SendToUser("/topic/private-messages")
		public ResponseMessage getServerPrivateMessage(Message message) throws InterruptedException {
			return new ResponseMessage(HtmlUtils.htmlEscape(
					"Server 私訊 : " + message.getMessageContent() 
					+ "  (To Client-Id : " + message.getClientId()+")"));
	}
	@MessageMapping(value = "/problemClient")
	@SendTo("/topic/account/messages")
	public ResponseMessage getAccountMessage(Message message) throws InterruptedException {
		return new ResponseMessage(HtmlUtils.htmlEscape("User : "+message.getMessageContent()));
		
	}
}
