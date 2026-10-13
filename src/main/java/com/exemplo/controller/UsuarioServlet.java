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
import java.util.List;

@WebServlet(name = "UsuarioServlet", urlPatterns = { "/", "/usuarios" })
public class UsuarioServlet extends HttpServlet {
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String acao = request.getParameter("acao");
            String idParam = request.getParameter("id");

            if ("novo".equalsIgnoreCase(acao)) {
                response.sendRedirect(request.getContextPath() + "/");
                return;
            }

            if ("editar".equalsIgnoreCase(acao) && idParam != null && !idParam.isBlank()) {
                Usuario usuario = usuarioDAO.buscarPorId(Long.valueOf(idParam));
                request.setAttribute("usuarioEditar", usuario);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }

            if ("excluir".equalsIgnoreCase(acao) && idParam != null && !idParam.isBlank()) {
                usuarioDAO.excluir(Long.valueOf(idParam));
                HttpSession session = request.getSession();
                session.setAttribute("mensagem", "Usuário removido com sucesso!");
                response.sendRedirect(request.getContextPath() + "/usuarios");
                return;
            }

            if (request.getRequestURI().endsWith("/gerenciador-usuarios/")) {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }

            List<Usuario> usuarios = usuarioDAO.listarTodos();
            request.setAttribute("usuarios", usuarios);
            request.getRequestDispatcher("/listar.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Erro ao processar usuários.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (nome == null || email == null || senha == null
                || nome.isBlank() || email.isBlank() || senha.isBlank()) {
            request.setAttribute("erro", "Preencha todos os campos antes de enviar.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        try {
            HttpSession session = request.getSession();

            if ("editar".equalsIgnoreCase(acao)) {
                Long id = Long.valueOf(request.getParameter("id"));
                Usuario usuario = usuarioDAO.buscarPorId(id);
                if (usuario != null) {
                    usuario.setNome(nome.trim());
                    usuario.setEmail(email.trim());
                    usuario.setSenha(senha);
                    usuarioDAO.atualizar(usuario);
                    session.setAttribute("mensagem", "Usuário atualizado com sucesso!");
                }
            } else {
                Usuario usuario = new Usuario();
                usuario.setNome(nome.trim());
                usuario.setEmail(email.trim());
                usuario.setSenha(senha);
                usuarioDAO.inserir(usuario);
                session.setAttribute("mensagem", "Usuário cadastrado com sucesso!");
            }

            response.sendRedirect(request.getContextPath() + "/usuarios");
        } catch (SQLException e) {
            HttpSession session = request.getSession();
            session.setAttribute("mensagem", "Não foi possível salvar o usuário.");
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
