package com.tablegame.service.member;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmailImg(String toEmail) throws MessagingException {
		MimeMessage mimeMessage = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        helper.setFrom("jack902221@gmail.com");
        helper.setTo(toEmail);
        helper.setSubject("主旨：郵件測試 嵌入靜態資源");
        helper.setText("<html><body><img src=\"cid:Test\" ></body></html>", true);

        FileSystemResource file = new FileSystemResource(new File("C:/pic/Test.jpg"));
        helper.addInline("Test", file);

        mailSender.send(mimeMessage);
        
	}
	
	public void sendEmailText(String toEmail) {
		SimpleMailMessage message = new SimpleMailMessage();//寄文字訊息
		message.setFrom("jack902221@gmail.com");
		message.setTo(toEmail);
		message.setSubject("郵件測試");
		message.setText("會員加入成功，歡迎您");
		
		mailSender.send(message);
	}
}
