<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuários</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f4f7fb; }
        .container { max-width: 900px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.08); }
        h1 { margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #d1d5db; padding: 12px; text-align: left; }
        th { background: #e5e7eb; }
        .alert { margin: 15px 0; padding: 12px 15px; border-radius: 5px; background: #dcfce7; color: #166534; }
        .links { margin-top: 20px; display: flex; gap: 16px; flex-wrap: wrap; }
        a { color: #1d4ed8; text-decoration: none; }
        a:hover { text-decoration: underline; }
        .btn { display: inline-block; padding: 8px 12px; border-radius: 5px; background: #1d4ed8; color: white; }
        .btn-danger { background: #dc2626; }
        .btn-secondary { background: #475569; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Usuários Cadastrados</h1>

        <c:if test="${not empty sessionScope.mensagem}">
            <div class="alert">${sessionScope.mensagem}</div>
            <c:remove var="mensagem" scope="session" />
        </c:if>

        <c:choose>
            <c:when test="${not empty usuarios}">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>E-mail</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="usuario" items="${usuarios}">
                        <tr>
                            <td>${usuario.id}</td>
                            <td>${usuario.nome}</td>
                            <td>${usuario.email}</td>
                            <td>
                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/usuarios?acao=editar&id=${usuario.id}">Editar</a>
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/usuarios?acao=excluir&id=${usuario.id}">Excluir</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>Nenhum usuário cadastrado até o momento.</p>
            </c:otherwise>
        </c:choose>

        <div class="links">
            <a href="${pageContext.request.contextPath}/">Voltar para o cadastro</a>
            <a href="${pageContext.request.contextPath}/login">Fazer login</a>
        </div>
    </div>
</body>
</html>
