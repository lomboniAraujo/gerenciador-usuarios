<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f4f7fb; }
        .container { max-width: 460px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.08); }
        h1 { margin-bottom: 20px; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        input { width: 100%; padding: 10px; margin-top: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 5px; }
        button { margin-top: 20px; padding: 12px 18px; background: #16a34a; color: #fff; border: none; border-radius: 5px; cursor: pointer; }
        .alert { margin: 15px 0; padding: 12px 15px; border-radius: 5px; background: #dcfce7; color: #166534; }
        .links { margin-top: 20px; }
        a { color: #1d4ed8; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login</h1>

        <c:if test="${not empty sessionScope.mensagem}">
            <div class="alert">${sessionScope.mensagem}</div>
            <c:remove var="mensagem" scope="session" />
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="email">E-mail</label>
            <input type="email" id="email" name="email" required>

            <label for="senha">Senha</label>
            <input type="password" id="senha" name="senha" required>

            <button type="submit">Entrar</button>
        </form>

        <div class="links">
            <a href="${pageContext.request.contextPath}/">Voltar para cadastro</a>
        </div>
    </div>
</body>
</html>
