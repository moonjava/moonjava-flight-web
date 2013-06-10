<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.joda.org/joda/time/tags" prefix="joda"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <c:if test="${empty voos}">
    <h4>
      <fmt:message key="cancelar.passagem.erro.solicitacao" />
    </h4>
  </c:if>

  <c:if test="${not empty voos}">
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

            <c:if test="${fn:contains(language, 'pt')}">
              <td><joda:format value="${voo.dataDePartida}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
              <td><joda:format value="${voo.dataDeChegada}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
              <td>${voo.status.setName('pt')}</td>
            </c:if>

            <c:if test="${fn:contains(language, 'en')}">
              <td><joda:format value="${voo.dataDePartida}" pattern="MM/dd/yyyy HH:mm:ss a" /></td>
              <td><joda:format value="${voo.dataDeChegada}" pattern="MM/dd/yyyy HH:mm:ss a" /></td>
              <td>${voo.status.setName('en')}</td>
            </c:if>

            <c:if test="${fn:contains(language, 'es')}">
              <td><joda:format value="${voo.dataDePartida}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
              <td><joda:format value="${voo.dataDeChegada}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
              <td>${voo.status.setName('es')}</td>
            </c:if>

          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>

</body>

</html>