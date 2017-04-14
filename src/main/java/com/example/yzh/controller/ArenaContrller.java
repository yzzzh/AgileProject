package com.example.yzh.controller;

import com.example.yzh.model.ArenaEntity;
import com.example.yzh.model.PlayerEntity;
import com.example.yzh.repository.ArenaRepository;
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
public class ArenaContrller {
    @Autowired
    ArenaRepository arenaRepository;

    final int pageSize = 20;
    int pageCount = 0;

    @RequestMapping(value = "/arena/{page}", method = RequestMethod.GET)
    public String arenas(@PathVariable("page") Integer page, ModelMap modelMap) {
        if (pageCount==0) {
            int total = arenaRepository.findAll().size();
            pageCount = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        }

        Pageable pageable = new PageRequest(--page,pageSize);
        Page<ArenaEntity> arenaPage = arenaRepository.findByPage(pageable);
        List<ArenaEntity> arenaList = arenaPage.getContent();

        modelMap.addAttribute("pageCount", pageCount);
        modelMap.addAttribute("currentPage", ++page);
        modelMap.addAttribute("arenaList", arenaList);
        return "arena/arenaList";
    }
    @RequestMapping("/arena/detail/{name}")
    public String arenaDetail(@PathVariable("name") String name, ModelMap modelMap) {
        List<ArenaEntity> arenaList = arenaRepository.findByName(name);

        modelMap.addAttribute("arenaList", arenaList);
        modelMap.addAttribute("arenaName", name);
        return "arena/arenaDetail";
    }
}
