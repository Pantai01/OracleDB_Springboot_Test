package com.example.cont_test;

import javax.sql.DataSource;

import static org.junit.Assert.assertEquals;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.oracle.OracleContainer;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@Testcontainers
@SpringBootTest
public class SpringBootDatabaseTest {

    //Variables to save ids
    static List<Integer> toDoItemsIds = new ArrayList<>();


    //Creation of the Oracle container with an Oracle Free DB 
    @Container
    @ServiceConnection
    static OracleContainer oracleContainer = new OracleContainer("gvenzl/oracle-free:23.6-slim-faststart")
            .withStartupTimeout(Duration.ofMinutes(5))
            .withConnectTimeoutSeconds(120)
            .withStartupAttempts(3) 
            .withUsername("todouser")
            .withPassword("password") 
            .withInitScript("DatabaseSetup.sql"); //Script de inicialización de la base de datos

    @Autowired
    DataSource dataSource;

    @DynamicPropertySource
    static void configureProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", oracleContainer::getJdbcUrl);
        registry.add("spring.datasource.username", oracleContainer::getUsername);
        registry.add("spring.datasource.password", oracleContainer::getPassword);
    }


    //Test 1
    @Test
    @Order(1)
    void springDatasourceConnection() throws SQLException {
        // Checks the version of the Oracle database
        // Helps to validate connection to the database
        try (Connection conn = dataSource.getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeQuery("select * from v$version");
        }
    }

    //Test 2
    @Test
    @Order(1)
    void tableCreationAndInsertsTesting() throws SQLException {
        // Checks if the table todoitem is created and has the inserted values
        try (Connection conn = dataSource.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from todoitem")) {
            while (rs.next()) {
                // Prints some info of the todoitem table registries 
                System.out.println("ID: " + rs.getInt("TODOITEM_ID") + ", Name: " + rs.getString("NAME"));
            }
        }
    }

    //Test 3
    @Test
    @Order(1)
    void dataConsistencyTesting() throws SQLException {
        // Checks if the first inserted project, which id should be 1, is present in the database
        try (Connection conn = dataSource.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from project where name = 'TEAM 11 Oracle Java'")) {
            while (rs.next()) {
                assertEquals(1,rs.getInt("PROJECT_ID") ); //Verifies that the id of the project is 1
                //If the project is not found, the test will fail
            }
        }
    }

    // Test 4
    @Test
    @Order(1)
    void createAndVerifyTwoTodoItems() throws SQLException {
        try (Connection conn = dataSource.getConnection();
                Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(
                    "INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) "
                            +
                            "VALUES ('Test Item 1', 'PENDING', 1, SYSTIMESTAMP, SYSTIMESTAMP, 1, 'Test Desc 1', 1)");
            stmt.executeUpdate(
                    "INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) "
                            +
                            "VALUES ('Test Item 2', 'PENDING', 1, SYSTIMESTAMP, SYSTIMESTAMP, 1, 'Test Desc 2', 1)");
            ResultSet rs = stmt.executeQuery(
                    "SELECT COUNT(*) FROM TODOUSER.TODOITEM WHERE NAME IN ('Test Item 1', 'Test Item 2')");
            rs.next();
            System.out.println("Count of ToDoItems with names 'Test Item 1' and 'Test Item 2' after creation: " + rs.getInt(1));
            assertEquals(2, rs.getInt(1));
        }
        // Verify that the two items were inserted and that their count is 2
    }

    @Test
    @Order(2)
    void getTwoToDoItems() throws SQLException {
        // Checks if the two todoitems are present in the database
        try (Connection conn = dataSource.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from todoitem where name like 'Test Item%'")) {
            List<String> toDoItemsNames = new ArrayList<>();
            while (rs.next()) {
                System.out.println("Getting ToDoItem by name - ID: " + rs.getInt("TODOITEM_ID") + ", Name: " + rs.getString("NAME"));
                toDoItemsIds.add(rs.getInt("TODOITEM_ID")); //Saving autogenerated ids for toDoItems.
                toDoItemsNames.add(rs.getString("NAME"));
            }
            List<Boolean> regexMatchingName = new ArrayList<>();
            for (String name : toDoItemsNames) {
                regexMatchingName.add(name.matches("Test Item [1-2]"));
            }
            assertEquals(true, regexMatchingName.get(0));
            assertEquals(true, regexMatchingName.get(1));
        }
    }
    
    
    @Test
    @Order(3)
    void deleteTwoToDoItems()throws SQLException{
        try (Connection conn = dataSource.getConnection();
                Statement stmt = conn.createStatement()) {
            for (Integer id : toDoItemsIds) {
                stmt.executeUpdate("DELETE FROM TODOUSER.TODOITEM WHERE TODOITEM_ID = " + id);
                System.out.println("Deleted ToDoItem with ID: " + id);
            }
            ResultSet rs = stmt.executeQuery(
                    "SELECT COUNT(*) FROM TODOUSER.TODOITEM WHERE NAME IN ('Test Item 1', 'Test Item 2')");
            rs.next();
            System.out.println("Count of ToDoItems with names 'Test Item 1' and 'Test Item 2' after deletion: " + rs.getInt(1));
            assertEquals(0, rs.getInt(1));

        }
    }
}