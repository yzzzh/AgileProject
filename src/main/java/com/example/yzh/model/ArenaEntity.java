package com.example.yzh.model;

import javax.persistence.*;

/**
 * Created by YZH on 2017/4/13.
 */
@Entity
@Table(name = "arena", schema = "nba_info", catalog = "")
public class ArenaEntity {
    private int id;
    private String arenaTeam;
    private String arenaStartEnd;
    private String arena;
    private String arenaLocation;
    private String arenaCapacity;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ArenaTeam", nullable = true, length = 255)
    public String getArenaTeam() {
        return arenaTeam;
    }

    public void setArenaTeam(String arenaTeam) {
        this.arenaTeam = arenaTeam;
    }

    @Basic
    @Column(name = "ArenaStartEnd", nullable = true, length = 255)
    public String getArenaStartEnd() {
        return arenaStartEnd;
    }

    public void setArenaStartEnd(String arenaStartEnd) {
        this.arenaStartEnd = arenaStartEnd;
    }

    @Basic
    @Column(name = "Arena", nullable = true, length = 255)
    public String getArena() {
        return arena;
    }

    public void setArena(String arena) {
        this.arena = arena;
    }

    @Basic
    @Column(name = "ArenaLocation", nullable = true, length = 255)
    public String getArenaLocation() {
        return arenaLocation;
    }

    public void setArenaLocation(String arenaLocation) {
        this.arenaLocation = arenaLocation;
    }

    @Basic
    @Column(name = "ArenaCapacity", nullable = true, length = 255)
    public String getArenaCapacity() {
        return arenaCapacity;
    }

    public void setArenaCapacity(String arenaCapacity) {
        this.arenaCapacity = arenaCapacity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArenaEntity that = (ArenaEntity) o;

        if (id != that.id) return false;
        if (arenaTeam != null ? !arenaTeam.equals(that.arenaTeam) : that.arenaTeam != null) return false;
        if (arenaStartEnd != null ? !arenaStartEnd.equals(that.arenaStartEnd) : that.arenaStartEnd != null)
            return false;
        if (arena != null ? !arena.equals(that.arena) : that.arena != null) return false;
        if (arenaLocation != null ? !arenaLocation.equals(that.arenaLocation) : that.arenaLocation != null)
            return false;
        if (arenaCapacity != null ? !arenaCapacity.equals(that.arenaCapacity) : that.arenaCapacity != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (arenaTeam != null ? arenaTeam.hashCode() : 0);
        result = 31 * result + (arenaStartEnd != null ? arenaStartEnd.hashCode() : 0);
        result = 31 * result + (arena != null ? arena.hashCode() : 0);
        result = 31 * result + (arenaLocation != null ? arenaLocation.hashCode() : 0);
        result = 31 * result + (arenaCapacity != null ? arenaCapacity.hashCode() : 0);
        return result;
    }
}
