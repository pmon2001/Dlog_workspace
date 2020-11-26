package com.kh.dlog.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dlog.admin.report.model.vo.Report;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.mainmenu.freenote.model.service.FreenoteService;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.SearchCondition;
import com.kh.dlog.member.model.vo.Member;

@Controller
public class CommunityController {
	
	@Autowired
	private FreenoteService fService;
	
	@RequestMapping("list.co")
	public String selectList(@RequestParam(value="topic", defaultValue="0") int topic, @RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		String topicName = "";
		switch(topic) {
			case 1: topicName="엔터"; break;
			case 2: topicName="생활"; break;
			case 3: topicName="취미"; break;
			case 4: topicName="지식"; break;
		}
		
		int listCount = fService.selectCommListCount(topicName);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Freenote> list = fService.selectCommList(topicName, pi);
		
		model.addAttribute("topic", topic);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "mainpage/community/communityMain";
	}
	
	@RequestMapping("search.co")
	public String selectSearchList(String keyword, String condition, @RequestParam(value="sort", defaultValue="recent") String sort, @RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		SearchCondition sc = new SearchCondition();
		switch(condition) {
		case "writerTitle": sc.setWirterTitle(keyword); break;
		case "writer":sc.setWriter(keyword); break;
		case "title":sc.setTitle(keyword); break;
		}
		sc.setSort(sort);
		
		int listCount = fService.selectSearchListCount(sc);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Freenote> list = fService.selectSearchList(sc, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return "mainpage/community/communitySearchList";
	}
	
	@RequestMapping("detail.co")
	public String selectCommunity(int fno, Model model, HttpSession session) {
		int result = fService.increaseCount(fno);
		
		if(result>0) {
			Freenote fn = fService.selectFreenote(fno, ((Member)session.getAttribute("loginUser")).getMemberNo());
			model.addAttribute("fn", fn);
			return "mainpage/community/communityDetailView";			
		}else {
			// 에러페이지
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="report.co", produces="text/html; charset=utf-8")
	public String reportPost(Report r) {
		System.out.println(r);
		if(fService.checkReport(r)==0) {
			return fService.insertReport(r) + "";
		}else {
			return "0";
		}
	}

}





