package com.example.demo_jstl.service;

import com.example.demo_jstl.model.Student;
import com.example.demo_jstl.repository.IStudentRepository;
import com.example.demo_jstl.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService{
    private IStudentRepository iStudentRepository = new StudentRepository();
    @Override
    public List<Student> display() {
        return iStudentRepository.display();
    }

    @Override
    public void save(Student student) {
        iStudentRepository.save(student);
    }

    @Override
    public void delete(int id) {
        iStudentRepository.delete(id);
    }

    public void edit(Student student){
        iStudentRepository.edit(student);
    }
}
