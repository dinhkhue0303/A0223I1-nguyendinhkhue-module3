package repository;

import model.Users;

import java.sql.*;
import java.util.*;


public class UsersRepository implements IUsersRepository{
    private static final String SELECT = "select * from users";
    private static final String INSERT = "insert into users(name,email,country) values(?,?,?)";
    private static final String DELETE = "call delete_by_id(?)";
    private static final String UPDATE = "update users set name = ?, email = ?, country = ? where id = ? ";
    private static final String FIND_COUNTRY = "call find_country(?)";
    private static final String ORDER_NAME = "select * from users order by name";
    @Override
    public List<Users> display() {
        List<Users> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnertion();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new Users(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void create(Users users) {
        Connection connection = BaseRepository.getConnertion();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1,users.getName());
            preparedStatement.setString(2,users.getEmail());
            preparedStatement.setString(3,users.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Users users) {
        Connection connection = BaseRepository.getConnertion();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,users.getName());
            preparedStatement.setString(2,users.getEmail());
            preparedStatement.setString(3,users.getCountry());
            preparedStatement.setInt(4,users.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnertion();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Users>find_country(String find_country){
        List<Users> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnertion();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_COUNTRY);
            callableStatement.setString(1,find_country);
            ResultSet resultSet = callableStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new Users(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Users> order_name() {
        List<Users> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnertion();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(ORDER_NAME);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new Users(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
