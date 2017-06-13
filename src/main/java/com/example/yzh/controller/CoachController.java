package com.example.yzh.controller;

import com.example.yzh.model.CoachEntity;
import com.example.yzh.model.PlayerEntity;
import com.example.yzh.repository.CoachRepository;
import com.example.yzh.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by YZH on 2017/4/13.
 */
@Controller
public class CoachController {
    @Autowired
    CoachRepository coachRepository;

    List<String> coachList = null;

    final int pageSize = 20;
    int pageCount = 0;

    @RequestMapping(value = "/coach/{page}", method = RequestMethod.GET)
    public String coaches(@PathVariable("page") Integer page, ModelMap modelMap) {
        if (pageCount==0) {
            int total = coachRepository.findAll().size();
            pageCount = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        }

        Pageable pageable = new PageRequest(--page,pageSize);
        Page<CoachEntity> coachPage = coachRepository.findByPage(pageable);
        List<CoachEntity> coachList = coachPage.getContent();

        modelMap.addAttribute("pageCount", pageCount);
        modelMap.addAttribute("currentPage", ++page);
        modelMap.addAttribute("coachList", coachList);
        return "coach/coachList";
    }
    @RequestMapping("/coach/detail/{name:.+}")
    public String coachDetail(@PathVariable("name") String name, ModelMap modelMap) {
        List<CoachEntity> coachList = coachRepository.findByName(name);
        System.out.println(name);
        modelMap.addAttribute("coachList", coachList);
        System.out.println(coachList.size());
        modelMap.addAttribute("coachName", name);
        return "coach/coachDetail";
    }

    @RequestMapping("/coaches")
    public String coachIndex(ModelMap modelMap) {
        if (coachList == null) {
            coachList = coachRepository.findName();
        }
        modelMap.addAttribute("coachList", coachList);
        return "coach/coaches";
    }

    @RequestMapping("/coaches/{name:.+}")
    public String coachIndexDetail(@PathVariable("name") String name, ModelMap modelMap) {
        if (coachList == null) {
            coachList = coachRepository.findName();
        }
        List<CoachEntity> coachDetailList = coachRepository.findByName(name);
        modelMap.addAttribute("coachDetailList", coachDetailList);
        modelMap.addAttribute("coachList", coachList);
        modelMap.addAttribute("coachName", name);
        return "coach/coaches";
    }
}
