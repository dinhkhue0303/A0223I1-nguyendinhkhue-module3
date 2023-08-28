package com.example.demo_jstl.repository;

import com.example.demo_jstl.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT = "select * from student";
    private final String INSERT = "insert into student(name,gender,point)\n" +
            "values(?,?,?)";
    private final String DELETE = "call delete_by_id(?)";
    private final String EDIT = "update student set name = ?, gender = ?, point = ?\n" +
            "where id = ?";

    @Override
    public List<Student> display() {
        List<Student> list = new ArrayList<>();
        Connection con = BaseRepository.getConnection();
        try {
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                double point = resultSet.getDouble("point");
                list.add(new Student(id,name,gender,point));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void save(Student student) {
        Connection con = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = con.prepareStatement(INSERT);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setDouble(3,student.getPoint());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection con = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = con.prepareCall(DELETE);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public void edit(Student student){
         Connection con = BaseRepository.getConnection();
         try {
             PreparedStatement preparedStatement = con.prepareStatement(EDIT);
             preparedStatement.setString(1,student.getName());
             preparedStatement.setBoolean(2,student.isGender());
             preparedStatement.setDouble(3,student.getPoint());
             preparedStatement.setDouble(4,student.getId());
             preparedStatement.executeUpdate();
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }
}
