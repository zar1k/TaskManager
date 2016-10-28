package com.gmail.andreyzarazka.dao;

import com.gmail.andreyzarazka.model.Task;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by JOB on 27.10.2016.
 */
public interface TaskRepository extends CrudRepository<Task, Integer> {
}
