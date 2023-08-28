package com.example.demo_jstl.repository;

import com.example.demo_jstl.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> display();
    void save(Student student);
    void delete(int id);
    void edit(Student student);
}
