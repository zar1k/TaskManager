package com.gmail.andreyzarazka.dao;

import com.gmail.andreyzarazka.model.Task;
import org.springframework.data.repository.CrudRepository;

/**
 * DAO interface for {@link Task} class.
 *
 * @author A.Zarazka
 * @version 1.0
 */
public interface TaskRepository extends CrudRepository<Task, Integer> {
}
