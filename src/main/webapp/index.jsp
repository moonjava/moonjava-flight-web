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
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <div class="control-group">
     <div class="controls">
	   <img data-src="holder.js/800x500" class="img-rounded" alt="800x500" style="width: 800px; height: 500px; margin-left: 250px;" src="/moonjava-flight-web/img/aviao_principal.svg.png">
     </div>
   </div>
	
  <c:import url="footer.jsp" />

</body>
</html>