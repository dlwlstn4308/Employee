package com.hybrid.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hybrid.model.City;
import com.hybrid.model.CityList;
import com.hybrid.model.CityPage;
import com.hybrid.service.CityListService;
import com.hybrid.service.CityPageService;
import com.hybrid.util.Pagination;

@Controller
@RequestMapping("/city")
public class CityController {
	static Log log = LogFactory.getLog(CityController.class);

	@Autowired	// 필드 주입
	CityListService cityListService;
	
	@Autowired
	CityPageService cityPageService;
	
	@RequestMapping("/main.html")
	public String getMainView() {
		log.info("getMainView()...");
		
		return "city/main"; // /WEB-INF/view/city/main.jsp
	}
	
	@RequestMapping("/list.html")
	public String getListView() {
		log.info("getListView()...");
		
		return "city/list"; 
	}
	
	@RequestMapping("/detail.html")
	public String getDetailView() {
		log.info("getDetailView()...");
		
		return "city/detail"; 
	}
	
	@RequestMapping(value={"", "/"})
	@ResponseBody
	public CityList getCityAll() {

		CityList list = cityListService.getList();
		
		return list;
	}
	
//	@RequestMapping("/page/{pageNo:[\\-\\+]{0,1}[0-9]+}")
	@RequestMapping("/page/{pageNo:[0-9]+}")
	@ResponseBody
	public CityPage getCityPage(@PathVariable int pageNo) {
	
		log.info("pageNo = " + pageNo);
		
		CityPage page = cityPageService.getPage(pageNo);
		
		return page;
	}
	
	
	
	
	
	
}
