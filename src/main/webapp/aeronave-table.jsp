<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <c:if test="${empty aeronaves}">
    <h4><fmt:message key="cancelar.passagem.erro.solicitacao" /></h4>
  </c:if>

  <c:if test="${not empty aeronaves}">
  <table class="table table-striped">
    <thead>
      <tr>
        <th></th>
        <th><fmt:message key="consultar.aeronave.coluna.0" /></th>
        <th><fmt:message key="consultar.aeronave.coluna.1" /></th>
        <th><fmt:message key="consultar.aeronave.coluna.2" /></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    
      <c:forEach var="aeronave" items="${aeronaves}" varStatus="id">
        <tr>
          <td><input type="checkbox" class="del" value="${aeronave.id}" /></td>
          <td>${aeronave.codigo}</td>
          <td>${aeronave.nome}</td>
          <td>${aeronave.qtdDeAssento}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  </c:if>

</body>

</html>