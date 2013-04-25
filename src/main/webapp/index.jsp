<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <c:import url="head.jsp" />
<!-- 
  <form style="margin-top: 70px;">
    <select id="language" name="language" onchange="submit()">
      <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
      <option value="pt" ${language == 'pt' ? 'selected' : ''}>Portugues</option>
      <option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
    </select>
  </form>
  <form>
    <label for="username"><fmt:message key="menubar.aeronave" />:</label> 
    <input type="text" id="username" name="username"> <br> 
    <label for="password"><fmt:message key="login.incorreto.messagem" />:</label> 
    <input type="password" id="password" name="password"> <br>
    <fmt:message key="login.button.submit" var="buttonValue" />
    <input type="submit" name="submit" value="${buttonValue}">
  </form>
 -->
  <c:import url="footer.jsp" />

</body>
</html>