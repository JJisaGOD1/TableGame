package com.tablegame.service.member;

import java.io.File;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.repository.member.MembersRepository;

@Service
public class EmailSenderService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MembersRepository memDao;
	
	public void sendEmailImg(String toEmail) throws MessagingException {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
        Optional<MembersBean> option = memDao.findByEmail(toEmail);
        MembersBean member = option.get();
        
        
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        helper.setFrom("jack902221@gmail.com");
        helper.setTo(toEmail);
        helper.setSubject("主旨：歡迎加入 憶起玩桌遊會員");
        helper.setText("<html><body><img src=\"cid:Test\" >"
        		+ "<div><h2>"+ member.getCusName()+ "歡迎您加入憶起玩桌遊會員</h2>"
        		+ "<h3>讓我們一起投入桌遊的世界吧</h3>"
        		+ "<a href=\"http://localhost:8080/homepage/\"><p>官方網址</p></a>"
        		+ "<p>Best Regards</p></div></body></html>", true);

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
