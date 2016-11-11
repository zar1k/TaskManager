package com.gmail.andreyzarazka.service;

import com.gmail.andreyzarazka.dao.TaskRepository;
import com.gmail.andreyzarazka.model.Task;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * Service class for {@link Task} class.
 *
 * @author A.Zarazka
 * @version 1.0
 */

@Service
@Transactional
public class TaskService {
    private static Logger log = Logger.getLogger(TaskService.class);

    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<Task> findAll() {
        List<Task> tasks = new ArrayList<>();
        for (Task task : taskRepository.findAll()) {
            tasks.add(task);
            log.info("Task list: ".concat(task.toString()));
        }
        return tasks;
    }

    public Task findTaskByID(int id) {
        log.info("Task successfully loaded. Task id = ".concat(String.valueOf(id)));
        return taskRepository.findOne(id);
    }

    public void save(Task task) {
        taskRepository.save(task);
        log.info("Task successfully saved. Task details: ".concat(task.toString()));
    }

    public void delete(int id) {
        taskRepository.delete(id);
        log.info("Task successfully delete. Task id = ".concat(String.valueOf(id)));
    }
}
