<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.joda.org/joda/time/tags" prefix="joda"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />


<!DOCTYPE html>
<html lang="${language}">
<body onload="window.print();">

  <c:if test="${not empty voo}">
    <table class="table table-striped">
      <thead>
        <tr>
          <th><fmt:message key="criar.pessoafisica.titulo.nome" /></th>
          <th><fmt:message key="criar.pessoafisica.titulo.cpf" /></th>
          <th><fmt:message key="consultar.voo.coluna.1" /></th>
          <th><fmt:message key="consultar.voo.coluna.2" /></th>
          <th><fmt:message key="consultar.voo.coluna.4" /></th>
          <th><fmt:message key="consultar.voo.coluna.5" /></th>
          <th><fmt:message key="criar.voo.titulo.preco" /></th>
        </tr>
      </thead>
      <tbody>

        <tr>
          <td>${pf.nome}</td>
          <td>${pf.cpf}</td>
          <td>${voo.origem}</td>
          <td>${voo.destino}</td>
          
          <c:if test="${language == 'pt'}">
            <td><joda:format value="${voo.dataDePartida}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
            <td><joda:format value="${voo.dataDeChegada}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
          </c:if>

          <c:if test="${language == 'en'}">
            <td><joda:format value="${voo.dataDePartida}" pattern="MM/dd/yyyy HH:mm:ss a" /></td>
            <td><joda:format value="${voo.dataDeChegada}" pattern="MM/dd/yyyy HH:mm:ss a" /></td>
          </c:if>

          <c:if test="${language == 'es'}">
            <td><joda:format value="${voo.dataDePartida}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
            <td><joda:format value="${voo.dataDeChegada}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
          </c:if>
          
          <td>${preco}</td>
        </tr>
      </tbody>
    </table>
  </c:if>

</body>
</html>