package com.finalProject.eduWorks.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.reservation.model.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;
	
	@RequestMapping("reservation.re")
	public ModelAndView Reservation(ModelAndView mv) {
		
		mv.setViewName("reservation/reservation");
		
		return mv;
	}
}
