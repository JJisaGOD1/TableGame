package com.tablegame.service.booking;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.booking.Booking;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmailImg(String toEmail,Booking book) throws MessagingException {
		MimeMessage mimeMessage = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        helper.setFrom("jack902221@gmail.com");
        helper.setTo(toEmail);
        helper.setSubject("主旨：瘋桌遊-訂位成功通知");
        
        helper.setText("<html><body><img src=\"cid:Test\" ></body></html>", true);
        helper.setText("訂位成功,有任何問題,歡迎來電"+"\n"+"姓名"+book.getUser().getCusName()+"\n"+
        "訂位人數："+book.getNumber()+"\n"+"時段: "+book.getNumber()+"\n"+"桌號: "+book.getSeveral()+"\n"
        +"備註:"+book.getRemark()+"\n"+"時間"+book.getReservation_date());

        
        
        
         FileSystemResource file = new FileSystemResource(new File("C:/Git/tablegame/src/main/webapp/uploaded/dice_logo.png/"));
        helper.addInline("Test", file);
       

        mailSender.send(mimeMessage);
        
	}
	
	public void sendEmailText(String toEmail,Booking book) {
		SimpleMailMessage message = new SimpleMailMessage();//寄文字訊息
		message.setFrom("jack902221@gmail.com");
		message.setTo(toEmail);
		message.setSubject("主旨：瘋桌遊-訂位成功通知");
		message.setText("訂位成功,有任何問題,歡迎來電"+"\n"+"姓名"+book.getUser().getCusName()+"\n"+
		        "訂位人數："+book.getNumber()+"\n"+"時段: "+book.getNumber()+"\n"+"桌號: "+book.getSeveral()+"\n"
		        +"備註:"+book.getRemark()+"\n"+"時間"+book.getReservation_date());
		
		mailSender.send(message);
	}
}
