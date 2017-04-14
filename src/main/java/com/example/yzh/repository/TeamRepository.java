package com.example.yzh.repository;

import com.example.yzh.model.PlayerEntity;
import com.example.yzh.model.TeamEntity;
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
public interface TeamRepository extends JpaRepository<TeamEntity, Integer> {
    @Transactional
    @Query("select team from TeamEntity team where team.teamName = :name")
    public List<TeamEntity> findByName(@Param("name") String name);

    @Transactional
    @Query("select team from TeamEntity team")
    public Page<TeamEntity> findByPage(Pageable pageable);
}
