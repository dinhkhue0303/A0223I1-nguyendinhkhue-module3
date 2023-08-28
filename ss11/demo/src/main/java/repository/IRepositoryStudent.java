package repository;

import model.Student;

import java.util.List;

public interface IRepositoryStudent {
    List<Student> display();
    void save(Student student);
}
