package com.tablegame.controller.product;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.product.Product;
import com.tablegame.model.bean.product.ProductImformation;
import com.tablegame.service.product.PIService;
import com.tablegame.service.product.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService serviceP;

	@Autowired
	private PIService servicePI;

	@PostMapping(value = "/addProduct")
	public ModelAndView postNewMessage(ModelAndView mav, @Valid @ModelAttribute(name = "P") Product product,
			BindingResult rs) {

		if (!rs.hasErrors()) {
			product.setProblem_count(0);
			if (product.getStock() <= 10) {
				product.setSellstatus("下架中");
			}
			serviceP.insert(product);
		}

		if (product != null) {
			Integer id = product.getProduct_id();
			String history = "登錄";
			Integer stock = product.getStock();

			ProductImformation PI = new ProductImformation();

			PI.setProductid_id(id);
			PI.setStock(stock);
			PI.setHistory(history);

			servicePI.insert(PI);
		}

		mav.setViewName("redirect:/viewProducts");

		return mav;
	}

	@GetMapping("/editProduct")
	public ModelAndView editMessagePage(ModelAndView mav, @RequestParam(name = "id") Integer id) {

		Product msg = serviceP.findById(id);

		ProductImformation Pi = servicePI.findLastHistoryById(id);

		msg.setStock(Pi.getStock());

		mav.getModel().put("P", msg);

//		mav.addObject("page", page);

		mav.setViewName("messages/editProduct");

		return mav;
	}

	@PostMapping("/editProduct")
	public ModelAndView editMessagePage(ModelAndView mav, @Valid @ModelAttribute(name = "P") Product msg,
			BindingResult result) {

		mav.setViewName("messages/editProduct");
		if (!result.hasErrors()) {
			if (msg.getMaxplayer() < msg.getMinplayer()) {
				String a = "最大人數需大於最小人數";
				mav.getModel().put("a", a);
				return mav;
			} else {
				// https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites

//					 https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
				Integer now = msg.getStock();
				Integer id = msg.getProduct_id();
				Integer past = serviceP.findById(id).getStock();

				ProductImformation insert = new ProductImformation();
				insert.setProductid_id(id);
				Date d = new Date();

				if (now != past) {
					int stockresult = past - now;
					if (now >= 0) {
						if (stockresult > 0) {
							insert.setStock(now);
							insert.setChangedate(d);
							insert.setHistory("出貨" + "-" + stockresult);
							servicePI.insert(insert);
						} else {
							insert.setStock(now);
							insert.setChangedate(d);
							insert.setHistory("進貨" + "+" + stockresult * -1);
							servicePI.insert(insert);
						}
					} else {
						System.out.println("ErrorStock");
						insert.setStock(past);
						insert.setChangedate(d);
						insert.setHistory("更動數量錯誤，庫存不得小於0");
						servicePI.insert(insert);
					}
				} else {
					insert.setStock(past);
					insert.setChangedate(d);
					insert.setHistory("商品資料更新" + "±0");
					servicePI.insert(insert);
				}

				msg.setProblem_count(0);
				serviceP.insert(msg);
			}
			mav.setViewName("redirect:/viewProducts");
		}

		return mav;
	}

	@GetMapping("/deleteProduct")
	public ModelAndView deleteMessagePage(ModelAndView mav, @RequestParam(name = "id") Integer id) {

		serviceP.delete(id);

		mav.setViewName("redirect:/viewProducts");

		return mav;
	}

	@GetMapping("/changePicture")
	public ModelAndView changePicturePage(ModelAndView mav, @RequestParam(name = "id") Integer id) {

		Product msg = serviceP.findById(id);

		mav.getModel().put("P", msg);

//		mav.addObject("page", page);

		mav.setViewName("messages/changePicture");

		return mav;
	}

	@PostMapping("/changePicture")
	public ModelAndView changePicturePage(ModelAndView mav, @Valid @ModelAttribute(name = "P") Product product,
			BindingResult result) {

		mav.setViewName("messages/changePicture");

		System.out.println("getOriginalFilename:" + product.getPhoto().getOriginalFilename());
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSS");
		Date date = new Date();
		String dateToStr = dateFormat.format(date);

		String OriginalFilename = product.getPhoto().getOriginalFilename();

		String fe = "";
		int i = OriginalFilename.lastIndexOf('.');
		if (i > 0) {
			fe = OriginalFilename.substring(i + 1);
		}
		System.out.println(fe);

		String a = "";
		try {
			InputStream InputStream = product.getPhoto().getInputStream();
			a = dateToStr + "." + fe;
			OutputStream out = new FileOutputStream("src/main/webapp/Photo/" + a);

			byte[] buf = new byte[256];
			while (InputStream.read(buf) != -1) {
				out.write(buf);
			}
			InputStream.close();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ProductImformation insert = new ProductImformation();
		insert.setProductid_id(product.getProduct_id());
		Date d = new Date();

		insert.setStock(product.getStock());
		insert.setChangedate(d);
		insert.setHistory("更改圖片");
		servicePI.insert(insert);

		if (!result.hasErrors()) {

			product.setPhotourl(a);
			serviceP.insert(product);
			mav.setViewName("redirect:/viewProducts");
		}
		return mav;
	}

	@GetMapping("/checkHistory")
	public ModelAndView checkHistoryPage(ModelAndView mav, @RequestParam(name = "id") Integer id) {

		List<ProductImformation> listPI = servicePI.findById(id);

		System.out.println(listPI);

		mav.getModel().put("listPI", listPI);

//		mav.addObject("page", page);

		mav.setViewName("messages/checkHistory");

		return mav;
	}
}
