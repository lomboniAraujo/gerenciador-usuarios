package com.exemplo.controller;

import com.exemplo.dao.UsuarioDAO;
import com.exemplo.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (email == null || senha == null || email.isBlank() || senha.isBlank()) {
            HttpSession session = request.getSession();
            session.setAttribute("mensagem", "Informe e-mail e senha para fazer login.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            Usuario usuario = usuarioDAO.buscarPorEmailSenha(email.trim(), senha);
            if (usuario != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuario);
                session.setAttribute("mensagem", "Login realizado com sucesso!");
                response.sendRedirect(request.getContextPath() + "/usuarios");
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("mensagem", "Credenciais inválidas. Tente novamente.");
            response.sendRedirect(request.getContextPath() + "/login");
        } catch (SQLException e) {
            throw new ServletException("Erro ao autenticar usuário.", e);
        }
    }
}
