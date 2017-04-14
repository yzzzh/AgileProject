package com.example.yzh.repository;

import com.example.yzh.model.PlayerEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by YZH on 2017/4/13.
 */
public interface PlayerRepository extends JpaRepository<PlayerEntity, Integer> {
    @Transactional
    @Query("select distinct player from PlayerEntity player where player.name = :name")
    public List<PlayerEntity> findByName(@Param("name") String name);

    @Transactional
    @Query("select player from PlayerEntity player")
    public Page<PlayerEntity> findByPage(Pageable pageable);
}

