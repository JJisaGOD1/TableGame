package tw.home.tablegame.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.origin.SystemEnvironmentOrigin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ch.qos.logback.core.net.SyslogOutputStream;
import tw.home.tablegame.dto.ProductIdDto;
import tw.home.tablegame.model.bean.ProductBean;
import tw.home.tablegame.model.service.GroupsService;


@RestController //A convenience annotation that is itself annotated with @Controller and @ResponseBody
public class GroupsAjaxController {
	@Autowired
	GroupsService service;
	
	@PostMapping("/groups/changeMaxNums")
	public ProductBean getProd(@RequestBody ProductIdDto json) {
		String prodId = json.getProductId();
		ProductBean prod = service.getProductBean(Integer.parseInt(prodId));
		return prod;
	}
}
