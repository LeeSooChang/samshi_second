package com.kdn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.FoodService;
import com.kdn.model.domain.Food;

@Controller
public class FoodController {
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); //request�뿉 ���옣
		model.addObject("content", "ErrorHandler.jsp"); //request�뿉 ���옣
		return model;
		
	}
	
	@Autowired
	private FoodService foodService;
	
	@RequestMapping(value = "test.do", method = RequestMethod.GET)
	public String addFoodForm(Food food){
		return "admin/addFoodForm";
	}
	
	@RequestMapping(value = "addFood.do", method = RequestMethod.GET)
	public String addFood(Food food){
		foodService.add(food);
		return "admin/addFoodForm";
	}
}
