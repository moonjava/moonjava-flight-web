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
            <h4><fmt:message key="menubar.aeronave" /></h4>

            <input type="hidden" id="errorMsg" value="<fmt:message key="erro.campo.vazio" />">
            <div id="notification"></div>

          </div>

          <form id="form" action="/moonjava-flight-web/base/aeronave/update" method="POST" style="margin-top: 10px;" class="form-horizontal">
            <div id="content"></div>
          </form>

        </div>
      </div>

      <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
  var msgRequired = document.id('errorMsg').get('value');

  var prmstr = window.location.search.substr(1);
  var prmarr = prmstr.split("&");
  var params = {};

  for ( var i = 0; i < prmarr.length; i++) {
    var tmparr = prmarr[i].split("=");
    params[tmparr[0]] = tmparr[1];
  }

  window.addEvent('domready', function() {
    new Request.HTML({
      method : 'get',
      url : '/moonjava-flight-web/base/aeronave/update',
      data : params,
      update : document.id('content')
    }).send();

  });
</script>
</body>
</html>