package com.gmail.andreyzarazka.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Simple Java object that present Task. This object @extends({@link BaseModel}) abstract class.
 *
 * @author A.Zarazka
 * @version 1.0
 */

@Entity(name = "t_tasks")
public class Task extends BaseModel {

    private String name;
    private String description;
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    private boolean finished;

    public Task() {
    }

    public Task(String name, String description, Date dateCreated, boolean finished) {
        this.name = name;
        this.description = description;
        this.dateCreated = dateCreated;
        this.finished = finished;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + super.getId() +
                ", name='" + name +
                ", description='" + description +
                ", dateCreated=" + dateCreated +
                ", finished=" + finished + '}';
    }
}
