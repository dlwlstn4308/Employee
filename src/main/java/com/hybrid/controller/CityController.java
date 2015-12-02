package com.hybrid.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hybrid.model.City;
import com.hybrid.model.CityList;
import com.hybrid.model.CityPage;
import com.hybrid.service.CityListService;
import com.hybrid.service.CityPageService;

@Controller
@RequestMapping("/city")
public class CityController {
	static Log log = LogFactory.getLog(CityController.class);

	@Autowired	// 필드 주입
	CityListService cityListService;
	
	@Autowired
	CityPageService cityPageService;
	
	/*
	 *  main.html 
	 */
	// method= RequestMethod.GET ==> GET 일때만 제한둠 / GET 아니면 404
	@RequestMapping(value="/main.html", method= RequestMethod.GET) 
	public String getMainView() {
		log.info("getMainView()...");
		
		return "city/main"; 
	}
	
	/*
	 *  list.html 
	 */
	@RequestMapping(value="/list.html" , method= RequestMethod.GET)
	public String getListView() {
		log.info("getListView()...");
		
		return "city/list"; 
	}
	
	/*
	 *  detail.html 
	 */	
	@RequestMapping(value="/detail.html" , method= RequestMethod.GET)
	public String getDetailView() {
		log.info("getDetailView()...");
		
		return "city/detail"; 
	}
	
	/*
	 *  append.html 
	 */	
	@RequestMapping(value="/append.html" , method= RequestMethod.GET)
	public String getAppendView() {
		log.info("getAppendView()...");
		
		return "city/append"; 
	}
	
	/*
	 *  modify.html 
	 */	
	@RequestMapping(value="/modify.html" , method= RequestMethod.GET)
	public String getModifyView() {
		log.info("getModifyView()...");
		
		return "city/modify"; 
	}
	
	/*
	 *  delete.html 
	 */	
	@RequestMapping(value="/delete.html" , method= RequestMethod.GET)
	public String getDeleteView() {
		log.info("getDeleteView()...");
		
		return "city/delete"; 
	}
	
	/*
	 *    URL_GET_LIST =  [/city/] or [/city/]
	 *    Accept = application /json
	 */
	@RequestMapping(value={"", "/"}, method= RequestMethod.GET)
	@ResponseBody
	public CityList getCityAll() {
		log.info("getCityAll() "); 
		
		CityList list = cityListService.getList();
		
		return list;
	}
	/*
	 *  URL_GET_ITEM_BASE = [city/{id}]
	 *  Accept = application /json
	 */
	
	@RequestMapping(value="/{id:[0-9]+}", method= RequestMethod.GET)
	@ResponseBody
	public City getCityItem(@PathVariable int id){
		log.info("getCityItem()..... id ="+id); 
		
		City city = new City();
		city.setId(id);
		city.setName("seoul");
		
		return city;
	}
	/*
	 *    URL_GET_PAGE =  [/city/page/{pageNO}] 
	 *    Accept = application /json
	 */		
//	@RequestMapping("/page/{pageNo:[\\-\\+]{0,1}[0-9]+}")
	@RequestMapping(value="/page/{pageNo:[0-9]+}" ,method= RequestMethod.GET)
	@ResponseBody
	public CityPage getCityPage(@PathVariable int pageNo) {
	
		log.info("getCityPage()... pageNo = " + pageNo);
		
		CityPage page = cityPageService.getPage(pageNo);
		
		return page;
	}
	
	
	
	
	
	
}
