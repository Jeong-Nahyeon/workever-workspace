package com.workever.wk.organogram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.workever.wk.organogram.model.vo.Organogram;

@Controller
public class OrganogramController {
	
	@Autowired
	private Organogram oService;
}
