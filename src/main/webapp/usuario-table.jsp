<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <c:if test="${empty usuarios}">
    <h4>
      <fmt:message key="cancelar.passagem.erro.solicitacao" />
    </h4>
  </c:if>

  <c:if test="${not empty usuarios}">
    <table class="table table-striped">
      <thead>
        <tr>
          <th></th>
          <th><fmt:message key="consultar.usuario.coluna.0" /></th>
          <th><fmt:message key="consultar.usuario.coluna.1" /></th>
          <th><fmt:message key="consultar.usuario.coluna.2" /></th>
          <th></th>
        </tr>
      </thead>
      <tbody>

        <c:forEach var="usuario" items="${usuarios}" varStatus="id">
          <tr>
            <td><input type="checkbox" class="del" value="${usuario.id}" /></td>
            <td>${usuario.codigo}</td>
            <td>${usuario.login}</td>

            <c:if test="${fn:contains(language, 'pt')}">
              <td>${usuario.perfil.setName('pt')}</td>
            </c:if>

            <c:if test="${fn:contains(language, 'en')}">
              <td>${usuario.perfil.setName('en')}</td>
            </c:if>

            <c:if test="${fn:contains(language, 'es')}">
              <td>${usuario.perfil.setName('es')}</td>
            </c:if>

          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>

</body>

</html>