package com.example.yzh.model;

import javax.persistence.*;

/**
 * Created by YZH on 2017/4/13.
 */
@Entity
@Table(name = "player", schema = "nba_info", catalog = "")
public class PlayerEntity {
    private int id;
    private String name;
    private String season;
    private Integer age;
    private Integer pts;
    private Integer g;
    private String lg;
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
    @Column(name = "Name", nullable = true, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Season", nullable = true, length = 255)
    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    @Basic
    @Column(name = "Age", nullable = true)
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "PTS", nullable = true)
    public Integer getPts() {
        return pts;
    }

    public void setPts(Integer pts) {
        this.pts = pts;
    }

    @Basic
    @Column(name = "G", nullable = true)
    public Integer getG() {
        return g;
    }

    public void setG(Integer g) {
        this.g = g;
    }

    @Basic
    @Column(name = "Lg", nullable = true, length = 255)
    public String getLg() {
        return lg;
    }

    public void setLg(String lg) {
        this.lg = lg;
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

        PlayerEntity that = (PlayerEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (season != null ? !season.equals(that.season) : that.season != null) return false;
        if (age != null ? !age.equals(that.age) : that.age != null) return false;
        if (pts != null ? !pts.equals(that.pts) : that.pts != null) return false;
        if (g != null ? !g.equals(that.g) : that.g != null) return false;
        if (lg != null ? !lg.equals(that.lg) : that.lg != null) return false;
        if (teamName != null ? !teamName.equals(that.teamName) : that.teamName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (season != null ? season.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        result = 31 * result + (pts != null ? pts.hashCode() : 0);
        result = 31 * result + (g != null ? g.hashCode() : 0);
        result = 31 * result + (lg != null ? lg.hashCode() : 0);
        result = 31 * result + (teamName != null ? teamName.hashCode() : 0);
        return result;
    }
}
