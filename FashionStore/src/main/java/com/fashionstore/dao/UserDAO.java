package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User login(String email, String password);

    User getUserById(int userId);

    User getUserByEmail(String email);

    boolean updateUser(User user);

    boolean updatePassword(int userId, String password);

    boolean emailExists(String email);

    boolean phoneExists(String phone);

    List<User> getAllUsers();

    boolean validateUser(String email, String password);

    void deleteUser(int userId);
}