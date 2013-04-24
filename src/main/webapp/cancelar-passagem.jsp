<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="br.com.moonjava.flight.bundle.arquivo" />

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
              <fmt:message key="menubar.passagem" />
            </h4>

            <input id="bilhete" class="span2" type="text" placeholder="<fmt:message key="transferir.passagem.titulo.filtroBilhete" />" /> 
            <button id="consultar" class="btn btn-info"><i class="icon-refresh icon-white"></i> <fmt:message key="transferir.passagem.consultar" /></button>

            <input type="hidden" id="errorMsg" value="<fmt:message key="atualizar.voo.joption.err" />">
            <div id="notification"></div>

          </div>

          <form id="form" action="/moonjava-flight-web/base/passagem/cancelar" method="POST" style="margin-top: 10px;" class="form-horizontal">
            <div id="content"></div>
          </form>

        </div>
      </div>

      <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
  var msgError = document.id('errorMsg').get('value');
  window.addEvent('domready', function() {
    
    document.id('consultar').addEvent('click', function() {
      new Request.HTML({
        method : 'get',
        url : '/moonjava-flight-web/base/passagem/cancelar',
        data : {
          bilhete : document.id('bilhete').get('value')
        },
        update : 'content'
      }).send();
    });
    
    new PagePassagem({
      id : 'content',
      page : '/moonjava-flight-web/cancelar-passagem.jsp',
      passagemUrl : '/moonjava-flight-web/base/passagem/cancelar',
      deleteErrorMsg : msgError,
    });

  });
</script>
</body>
</html>