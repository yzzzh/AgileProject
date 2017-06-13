package com.example.yzh.controller;

import com.example.yzh.model.PlayerEntity;
import com.example.yzh.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by YZH on 2017/4/13.
 */
@Controller
public class MainController {

    @Autowired
    PlayerRepository playerRepository;

    List<String> playerList = null;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        if (playerList == null) {
            playerList = playerRepository.findName();
        }
        modelMap.addAttribute("playerList", playerList);
        return "player/players";
    }


}
