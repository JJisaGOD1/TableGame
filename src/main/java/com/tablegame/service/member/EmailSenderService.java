package com.tablegame.service.member;

import java.io.File;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;

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
	
	
	
	public void sendEmailImg(String toEmail,HttpServlet servlet) throws MessagingException {
		
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
        Optional<MembersBean> option = memDao.findByEmail(toEmail);
        MembersBean member = option.get();
        
        
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        helper.setFrom("ginojay80@gmail.com");
        helper.setTo(toEmail);
        helper.setSubject("主旨：歡迎加入 憶起玩桌遊會員");
        helper.setText("<html><body><div style='text-align: center; width: 30vw;'><img src=\"cid:Test\" width='500px'>"
        		+ "<h1>"+ member.getCusName()+ "歡迎您加入憶起玩桌遊會員</h1>"
        		+ "<h2>讓我們一起投入桌遊的世界吧</h2>"
        		+ "<a href=\"http://localhost:8080/homepage/\"><h3>官方網址<h3></a>"
        		+ "<h3>Best Regards</h3></div></body></html>", true);
//        C:/GitTableGame/TableGame/src/main/webapp/uploaded/dice-logo-mail.jpg
        FileSystemResource file = new FileSystemResource
        								(new File(servlet.getServletContext().getRealPath("uploaded/dice-logo-mail.jpg")));
        helper.addInline("Test", file);
        
        
        mailSender.send(mimeMessage);
        
	}
	
	public void sendEmailText(String toEmail) {
		SimpleMailMessage message = new SimpleMailMessage();//寄文字訊息
		message.setFrom("ginojay80@gmail.com");
		message.setTo(toEmail);
		message.setSubject("郵件測試");
		message.setText("會員加入成功，歡迎您");
		
		mailSender.send(message);
	}
}
