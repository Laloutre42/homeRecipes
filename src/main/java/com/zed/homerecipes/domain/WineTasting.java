package com.zed.homerecipes.domain;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.Objects;

/**
 * A WineTasting.
 */
@Entity
@Table(name = "wine_tasting")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class WineTasting implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "date")
    private ZonedDateTime date;

    @Column(name = "note")
    private Integer note;

    @Column(name = "comment")
    private String comment;

    @ManyToOne
    private Wine wine;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ZonedDateTime getDate() {
        return date;
    }

    public void setDate(ZonedDateTime date) {
        this.date = date;
    }

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Wine getWine() {
        return wine;
    }

    public void setWine(Wine wine) {
        this.wine = wine;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WineTasting wineTasting = (WineTasting) o;
        if(wineTasting.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, wineTasting.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "WineTasting{" +
            "id=" + id +
            ", date='" + date + "'" +
            ", note='" + note + "'" +
            ", comment='" + comment + "'" +
            '}';
    }
}
