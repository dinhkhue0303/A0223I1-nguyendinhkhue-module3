package service;

import model.Users;

import java.util.List;

public interface IUsersService {
    List<Users> display();
    void create(Users users);
    void update(Users users);
    void delete(int id);
    List<Users> find_country(String find_coutnry);
    List<Users> order_name();
}
