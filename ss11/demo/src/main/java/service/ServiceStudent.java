package service;

import model.Student;
import repository.IRepositoryStudent;
import repository.RepositoryStudent;

import java.util.List;

public class ServiceStudent implements IServiceStudent{
    IRepositoryStudent iRepositoryStudent = new RepositoryStudent();
    @Override
    public List<Student> display() {
        return iRepositoryStudent.display();
    }

    @Override
    public void save(Student student) {
        iRepositoryStudent.save(student);
    }
}
