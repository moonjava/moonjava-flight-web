<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="br.com.moonjava.flight.bundle.arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <table class="table table-striped">
    <thead>
      <tr>
        <th></th>
        <th><fmt:message key="consultar.voo.coluna.0" /></th>
        <th><fmt:message key="consultar.voo.coluna.1" /></th>
        <th><fmt:message key="consultar.voo.coluna.2" /></th>
        <th><fmt:message key="consultar.voo.coluna.3" /></th>
        <th><fmt:message key="consultar.voo.coluna.4" /></th>
        <th><fmt:message key="consultar.voo.coluna.5" /></th>
        <th><fmt:message key="consultar.voo.coluna.6" /></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    
      <c:forEach var="voo" items="${voos}" varStatus="id">
        <tr>
          <td><input type="checkbox" class="del" value="${voo.id}" /></td>
          <td>${voo.codigo}</td>
          <td>${voo.origem}</td>
          <td>${voo.destino}</td>
          <td>${voo.escala}</td>
          <td>${voo.dataDePartida.toString("dd/MM/yyyy HH:mm")}</td>
          <td>${voo.dataDeChegada.toString("dd/MM/yyyy HH:mm")}</td>
          <td>${voo.status}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

</body>

</html>