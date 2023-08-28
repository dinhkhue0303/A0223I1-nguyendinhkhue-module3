package service;

import model.Users;
import repository.IUsersRepository;
import repository.UsersRepository;

import java.util.List;

public class UsersService implements IUsersService{
    IUsersRepository iUsersRepository = new UsersRepository();
    @Override
    public List<Users> display() {
        return iUsersRepository.display();
    }

    @Override
    public void create(Users users) {
        iUsersRepository.create(users);
    }

    @Override
    public void update(Users users) {
        iUsersRepository.update(users);
    }

    @Override
    public void delete(int id) {
        iUsersRepository.delete(id);
    }

    @Override
    public List<Users> find_country(String find_coutnry) {
        return iUsersRepository.find_country(find_coutnry);
    }

    @Override
    public List<Users> order_name() {
        return iUsersRepository.order_name();
    }
}
