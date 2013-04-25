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

  <div id="bd">
    <div class="container">
      <div></div>

      <div class="row">
        <div class="panel">
          <div id="container" class="panel-hd">
            <h4>
              <fmt:message key="erro" />
            </h4>

            <div class="alert alert-error fade in">
              <button type="button" class="close" data-dismiss="alert">×</button>
              <strong>${exception}</strong>
            </div>

          </div>
        </div>

        <c:import url="footer.jsp" />
  
      </div>
    </div>
  </div>
  
</body>
</html>