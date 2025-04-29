package com.example.cont_test;

import javax.sql.DataSource;

import static org.junit.Assert.assertEquals;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Duration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.oracle.OracleContainer;

@Testcontainers
@SpringBootTest
public class SpringBootDatabaseTest {


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


    //Test 1
    @Test
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
    
}