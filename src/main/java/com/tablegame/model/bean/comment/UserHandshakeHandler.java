package com.tablegame.model.bean.comment;

import java.security.Principal;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

import com.sun.security.auth.UserPrincipal;

public class UserHandshakeHandler extends DefaultHandshakeHandler {

	@Override
	protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler,
			Map<String, Object> attributes) {
		
		final String randomId = UUID.randomUUID().toString();
		System.out.println("User with ID"+":"+randomId);
		
		return new UserPrincipal(randomId);
	}

}
