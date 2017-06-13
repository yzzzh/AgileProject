package com.example.yzh.repository;

import com.example.yzh.model.ArenaEntity;
import com.example.yzh.model.CoachEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by YZH on 2017/4/13.
 */
public interface ArenaRepository extends JpaRepository<ArenaEntity, Integer> {
    @Transactional
    @Query("select arena from ArenaEntity arena where arena.arena = :name")
    public List<ArenaEntity> findByName(@Param("name") String name);

    @Transactional
    @Query("select distinct arena.arena from ArenaEntity arena")
    public List<String> findName();

    @Transactional
    @Query("select arena from ArenaEntity arena")
    public Page<ArenaEntity> findByPage(Pageable pageable);
}
