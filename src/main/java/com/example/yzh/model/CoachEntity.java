package com.example.yzh.model;

import javax.persistence.*;

/**
 * Created by YZH on 2017/4/13.
 */
@Entity
@Table(name = "coach", schema = "nba_info", catalog = "")
public class CoachEntity {
    private int id;
    private String coachName;
    private String teamSeason;
    private String teamName;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CoachName", nullable = true, length = 255)
    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    @Basic
    @Column(name = "TeamSeason", nullable = true, length = 255)
    public String getTeamSeason() {
        return teamSeason;
    }

    public void setTeamSeason(String teamSeason) {
        this.teamSeason = teamSeason;
    }

    @Basic
    @Column(name = "TeamName", nullable = true, length = 255)
    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CoachEntity that = (CoachEntity) o;

        if (id != that.id) return false;
        if (coachName != null ? !coachName.equals(that.coachName) : that.coachName != null) return false;
        if (teamSeason != null ? !teamSeason.equals(that.teamSeason) : that.teamSeason != null) return false;
        if (teamName != null ? !teamName.equals(that.teamName) : that.teamName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (coachName != null ? coachName.hashCode() : 0);
        result = 31 * result + (teamSeason != null ? teamSeason.hashCode() : 0);
        result = 31 * result + (teamName != null ? teamName.hashCode() : 0);
        return result;
    }
}
