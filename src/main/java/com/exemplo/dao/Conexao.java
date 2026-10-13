package com.exemplo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexao {
    private static final String URL = "jdbc:h2:mem:gerenciador_usuarios;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE";
    private static final String USUARIO = "sa";
    private static final String SENHA = "";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver H2 não encontrado.", e);
        }

        Connection connection = DriverManager.getConnection(URL, USUARIO, SENHA);
        criarTabelaSeNaoExistir(connection);
        return connection;
    }

    private static void criarTabelaSeNaoExistir(Connection connection) {
        String sql = "CREATE TABLE IF NOT EXISTS usuarios ("
                + "id BIGINT AUTO_INCREMENT PRIMARY KEY, "
                + "nome VARCHAR(100) NOT NULL, "
                + "email VARCHAR(100) NOT NULL UNIQUE, "
                + "senha VARCHAR(255) NOT NULL"
                + ")";

        try (Statement statement = connection.createStatement()) {
            statement.execute(sql);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar a tabela usuarios.", e);
        }
    }
}
