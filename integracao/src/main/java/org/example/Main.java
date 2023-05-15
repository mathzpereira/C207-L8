package org.example;
import DAO.UserDAO;
import Model.User;

public class Main {
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        User user1 = new User("Matheus","12312312312");
        User user2 = new User("Hulk","32132132132");

        //userDAO.insertUser(user1);
        //userDAO.insertUser(user2);

        //userDAO.deleteUser(2);

        userDAO.updateUser(3,user1);

        userDAO.selectUser();
    }
}