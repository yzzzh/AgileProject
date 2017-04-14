package com.example.yzh.repository;

import com.example.yzh.model.CoachEntity;
import com.example.yzh.model.PlayerEntity;
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
public interface CoachRepository extends JpaRepository<CoachEntity, Integer> {
    @Transactional
    @Query("select coach from CoachEntity coach where coach.coachName = :name")
    public List<CoachEntity> findByName(@Param("name") String name);

    @Transactional
    @Query("select coach from CoachEntity coach")
    public Page<CoachEntity> findByPage(Pageable pageable);
}
