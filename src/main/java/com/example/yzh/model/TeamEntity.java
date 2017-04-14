package com.example.yzh.model;

import javax.persistence.*;

/**
 * Created by YZH on 2017/4/13.
 */
@Entity
@Table(name = "team", schema = "nba_info", catalog = "")
public class TeamEntity {
    private int id;
    private String teamName;
    private String teamSeason;
    private String teamAbbr;
    private Integer teamFrom;
    private Integer teamTo;
    private Integer teamYrs;
    private Integer teamG;
    private Integer teamW;
    private Integer teamL;
    private Integer teamChamp;
    private String teamCoaches;
    private String arena;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "TeamName", nullable = true, length = 255)
    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
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
    @Column(name = "TeamAbbr", nullable = true, length = 255)
    public String getTeamAbbr() {
        return teamAbbr;
    }

    public void setTeamAbbr(String teamAbbr) {
        this.teamAbbr = teamAbbr;
    }

    @Basic
    @Column(name = "TeamFrom", nullable = true)
    public Integer getTeamFrom() {
        return teamFrom;
    }

    public void setTeamFrom(Integer teamFrom) {
        this.teamFrom = teamFrom;
    }

    @Basic
    @Column(name = "TeamTo", nullable = true)
    public Integer getTeamTo() {
        return teamTo;
    }

    public void setTeamTo(Integer teamTo) {
        this.teamTo = teamTo;
    }

    @Basic
    @Column(name = "TeamYrs", nullable = true)
    public Integer getTeamYrs() {
        return teamYrs;
    }

    public void setTeamYrs(Integer teamYrs) {
        this.teamYrs = teamYrs;
    }

    @Basic
    @Column(name = "TeamG", nullable = true)
    public Integer getTeamG() {
        return teamG;
    }

    public void setTeamG(Integer teamG) {
        this.teamG = teamG;
    }

    @Basic
    @Column(name = "TeamW", nullable = true)
    public Integer getTeamW() {
        return teamW;
    }

    public void setTeamW(Integer teamW) {
        this.teamW = teamW;
    }

    @Basic
    @Column(name = "TeamL", nullable = true)
    public Integer getTeamL() {
        return teamL;
    }

    public void setTeamL(Integer teamL) {
        this.teamL = teamL;
    }

    @Basic
    @Column(name = "TeamChamp", nullable = true)
    public Integer getTeamChamp() {
        return teamChamp;
    }

    public void setTeamChamp(Integer teamChamp) {
        this.teamChamp = teamChamp;
    }

    @Basic
    @Column(name = "TeamCoaches", nullable = true, length = 255)
    public String getTeamCoaches() {
        return teamCoaches;
    }

    public void setTeamCoaches(String teamCoaches) {
        this.teamCoaches = teamCoaches;
    }

    @Basic
    @Column(name = "Arena", nullable = true, length = 255)
    public String getArena() {
        return arena;
    }

    public void setArena(String arena) {
        this.arena = arena;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TeamEntity that = (TeamEntity) o;

        if (id != that.id) return false;
        if (teamName != null ? !teamName.equals(that.teamName) : that.teamName != null) return false;
        if (teamSeason != null ? !teamSeason.equals(that.teamSeason) : that.teamSeason != null) return false;
        if (teamAbbr != null ? !teamAbbr.equals(that.teamAbbr) : that.teamAbbr != null) return false;
        if (teamFrom != null ? !teamFrom.equals(that.teamFrom) : that.teamFrom != null) return false;
        if (teamTo != null ? !teamTo.equals(that.teamTo) : that.teamTo != null) return false;
        if (teamYrs != null ? !teamYrs.equals(that.teamYrs) : that.teamYrs != null) return false;
        if (teamG != null ? !teamG.equals(that.teamG) : that.teamG != null) return false;
        if (teamW != null ? !teamW.equals(that.teamW) : that.teamW != null) return false;
        if (teamL != null ? !teamL.equals(that.teamL) : that.teamL != null) return false;
        if (teamChamp != null ? !teamChamp.equals(that.teamChamp) : that.teamChamp != null) return false;
        if (teamCoaches != null ? !teamCoaches.equals(that.teamCoaches) : that.teamCoaches != null) return false;
        if (arena != null ? !arena.equals(that.arena) : that.arena != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (teamName != null ? teamName.hashCode() : 0);
        result = 31 * result + (teamSeason != null ? teamSeason.hashCode() : 0);
        result = 31 * result + (teamAbbr != null ? teamAbbr.hashCode() : 0);
        result = 31 * result + (teamFrom != null ? teamFrom.hashCode() : 0);
        result = 31 * result + (teamTo != null ? teamTo.hashCode() : 0);
        result = 31 * result + (teamYrs != null ? teamYrs.hashCode() : 0);
        result = 31 * result + (teamG != null ? teamG.hashCode() : 0);
        result = 31 * result + (teamW != null ? teamW.hashCode() : 0);
        result = 31 * result + (teamL != null ? teamL.hashCode() : 0);
        result = 31 * result + (teamChamp != null ? teamChamp.hashCode() : 0);
        result = 31 * result + (teamCoaches != null ? teamCoaches.hashCode() : 0);
        result = 31 * result + (arena != null ? arena.hashCode() : 0);
        return result;
    }
}
