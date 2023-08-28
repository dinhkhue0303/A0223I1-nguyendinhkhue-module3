package com.example.demo_jstl.service;

import com.example.demo_jstl.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> display();
    void save(Student student);
    void delete(int id);
    void edit(Student student);
}
