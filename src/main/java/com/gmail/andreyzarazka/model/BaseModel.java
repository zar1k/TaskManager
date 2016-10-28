package com.gmail.andreyzarazka.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.util.Objects;

/**
 * Created by JOB on 28.10.2016.
 */

@MappedSuperclass
public abstract class BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof BaseModel)) return false;
        BaseModel baseModel = (BaseModel) obj;
        return getId() == baseModel.getId();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }
}
