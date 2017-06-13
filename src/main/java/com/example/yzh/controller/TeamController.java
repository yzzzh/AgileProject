package com.example.yzh.controller;

import com.example.yzh.model.TeamEntity;
import com.example.yzh.repository.TeamRepository;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.data.repository.init.ResourceReader.Type.JSON;

/**
 * Created by YZH on 2017/4/13.
 */
@Controller
public class TeamController {
    @Autowired
    TeamRepository teamRepository;

    List<String> teamList = null;

    final int pageSize = 20;
    int pageCount = 0;

    @RequestMapping(value = "/team/{page}", method = RequestMethod.GET)
    public String teams(@PathVariable("page") Integer page, ModelMap modelMap) {
        if (pageCount==0) {
            int total = teamRepository.findAll().size();
            pageCount = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        }

        Pageable pageable = new PageRequest(--page,pageSize);
        Page<TeamEntity> teamPage = teamRepository.findByPage(pageable);
        List<TeamEntity> teamList = teamPage.getContent();

        modelMap.addAttribute("pageCount", pageCount);
        modelMap.addAttribute("currentPage", ++page);
        modelMap.addAttribute("teamList", teamList);
        return "team/teamList";
    }
    @RequestMapping("/team/detail/{name}")
    public String teamDetail(@PathVariable("name") String name, ModelMap modelMap) {
        List<TeamEntity> teamList = teamRepository.findByName(name);

        modelMap.addAttribute("teamList", teamList);
        modelMap.addAttribute("teamName", name);
        return "team/teamDetail";
    }

    @RequestMapping("/teams")
    public String teamIndex(ModelMap modelMap) {
        if (teamList == null) {
            teamList = teamRepository.findName();
        }
        modelMap.addAttribute("teamList", teamList);
        return "team/teams";
    }

    @RequestMapping("/teams/{name}")
    public String teamIndexDetail(@PathVariable("name") String name, ModelMap modelMap) {
        if (teamList == null) {
            teamList = teamRepository.findName();
        }
        List<TeamEntity> teamDetailList = teamRepository.findByName(name);
        modelMap.addAttribute("teamDetailList", teamDetailList);
        modelMap.addAttribute("teamList", teamList);
        modelMap.addAttribute("teamName", name);
        return "team/teams";
    }

    @RequestMapping(value="/team/getTeamList")
    public @ResponseBody List<String> getTeamList() throws IOException{
        return teamList;
    }

    @RequestMapping(value="/x",method=RequestMethod.GET)
    public @ResponseBody String paramTest(){
        System.out.println(123);
        return teamList.toString();
    }

}
