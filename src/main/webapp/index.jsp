<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Usuários</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f4f7fb; }
        .container { max-width: 600px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.08); }
        h1 { margin-bottom: 20px; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        input { width: 100%; padding: 10px; margin-top: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 5px; }
        button { margin-top: 20px; padding: 12px 18px; background: #1d4ed8; color: #fff; border: none; border-radius: 5px; cursor: pointer; }
        .alert { margin: 15px 0; padding: 12px 15px; border-radius: 5px; background: #dcfce7; color: #166534; }
        .error { background: #fee2e2; color: #991b1b; }
        .links { margin-top: 20px; display: flex; gap: 16px; flex-wrap: wrap; }
        a { color: #1d4ed8; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h1>${not empty usuarioEditar ? 'Editar Usuário' : 'Cadastro de Usuário'}</h1>

        <c:if test="${not empty sessionScope.mensagem}">
            <div class="alert">${sessionScope.mensagem}</div>
            <c:remove var="mensagem" scope="session" />
        </c:if>

        <c:if test="${not empty erro}">
            <div class="alert error">${erro}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/usuarios" method="post">
            <input type="hidden" name="acao" value="${not empty usuarioEditar ? 'editar' : 'cadastrar'}">
            <c:if test="${not empty usuarioEditar}">
                <input type="hidden" name="id" value="${usuarioEditar.id}">
            </c:if>

            <label for="nome">Nome</label>
            <input type="text" id="nome" name="nome" value="${usuarioEditar.nome}" required>

            <label for="email">E-mail</label>
            <input type="email" id="email" name="email" value="${usuarioEditar.email}" required>

            <label for="senha">Senha</label>
            <input type="password" id="senha" name="senha" value="${usuarioEditar.senha}" required>

            <button type="submit">${not empty usuarioEditar ? 'Salvar alterações' : 'Cadastrar'}</button>
        </form>

        <div class="links">
            <a href="${pageContext.request.contextPath}/usuarios">Listar usuários</a>
            <a href="${pageContext.request.contextPath}/login">Ir para Login</a>
        </div>
    </div>
</body>
</html>
