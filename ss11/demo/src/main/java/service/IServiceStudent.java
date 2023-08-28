package service;

import model.Student;

import java.util.List;

public interface IServiceStudent {
    List<Student> display();
    void save(Student student);
}
