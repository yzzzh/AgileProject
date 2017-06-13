package com.example.yzh.controller;

import com.example.yzh.model.PlayerEntity;
import com.example.yzh.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by YZH on 2017/4/13.
 */
@Controller
public class PlayerController {
    @Autowired
    PlayerRepository playerRepository;

    List<String> playerList = null;

    final int pageSize = 20;
    int pageCount = 0;

    @RequestMapping(value = "/player/{page}", method = RequestMethod.GET)
    public String players(@PathVariable("page") Integer page,ModelMap modelMap) {
        if (pageCount==0) {
            int total = playerRepository.findAll().size();
            pageCount = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        }

        Pageable pageable = new PageRequest(--page,pageSize);
        Page<PlayerEntity> playerPage = playerRepository.findByPage(pageable);
        List<PlayerEntity> playerList = playerPage.getContent();

        modelMap.addAttribute("pageCount", pageCount);
        modelMap.addAttribute("currentPage", ++page);
        modelMap.addAttribute("playerList", playerList);
        return "player/playerList";
    }
    @RequestMapping("/player/detail/{name}")
    public String playerDetail(@PathVariable("name") String name, ModelMap modelMap) {
        List<PlayerEntity> playerList = playerRepository.findByName(name);

        modelMap.addAttribute("playerList", playerList);
        modelMap.addAttribute("playerName", name);
        return "player/playerDetail";
    }

    @RequestMapping("/players")
    public String playerIndex(ModelMap modelMap) {
        if (playerList == null) {
            playerList = playerRepository.findName();
        }
        modelMap.addAttribute("playerList", playerList);
        return "player/players";
    }

    @RequestMapping("/players/{name}")
    public String playerIndexDetail(@PathVariable("name") String name, ModelMap modelMap) {
        if (playerList == null) {
            playerList = playerRepository.findName();
        }
        List<PlayerEntity> playerDetailList = playerRepository.findByName(name);
        modelMap.addAttribute("playerDetailList", playerDetailList);
        modelMap.addAttribute("playerList", playerList);
        modelMap.addAttribute("playerName", name);
        return "player/players";
    }
}
