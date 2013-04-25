<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="br.com.moonjava.flight.util.FlightRequestWrapper"%>
<%@ page language="java" import="br.com.moonjava.flight.model.base.AeronaveModel"%>
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
            <h4><fmt:message key="menubar.voo" /></h4>

            <input type="hidden" id="errorDeleteMsg" value="<fmt:message key="erro.campo.vazio" />">
            <div id="notification"></div>

          </div>

          <form id="form" action="/moonjava-flight-web/base/voo/create" method="POST" style="margin-top: 10px;" class="form-horizontal">

            <div id="content" class="control-group"></div>
            <div class="control-group">
              <label class="control-label" for="origem"><fmt:message key="criar.voo.titulo.origem" /></label>
              <div class="controls">
                <input id="origem" name="origem" class="span3 required" type="text" placeholder="<fmt:message key="criar.voo.titulo.origem" />">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="destino"><fmt:message key="criar.voo.titulo.destino" /></label>
              <div class="controls">
                <input id="destino" name="destino" class="span3 required" type="text" placeholder="<fmt:message key="criar.voo.titulo.destino" />">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="escala"><fmt:message key="criar.voo.titulo.escala" /></label>
              <div class="controls">
                <input id="escala" class="span3" name="escala" type="text" placeholder="<fmt:message key="criar.voo.titulo.escala" />">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="partida"><fmt:message key="criar.voo.titulo.partida" /></label>
              <div class="controls">
                <input id="partida" class="span3 required" name="partida" type="text" placeholder="<fmt:message key="criar.voo.titulo.partida" />">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="chegada"><fmt:message key="criar.voo.titulo.chegada" /></label>
              <div class="controls">
                <input id="chegada" class="span3 required" name="chegada" type="text" placeholder="<fmt:message key="criar.voo.titulo.chegada" />">
              </div>
            </div>

            <div class="control-group">
              <label class="control-label" for="aeronave"><fmt:message key="criar.voo.titulo.aeronave" /></label>
              <div class="controls">
                <c:set var="aeronaves" value="<%=new AeronaveModel().consultar(new FlightRequestWrapper(request))%>" />
                <select id="aeronave" class="span2" title="<fmt:message key="criar.voo.titulo.aeronave" />">
              	  <c:forEach var="current" items="${aeronaves}">
              	    <option value="${current.getId()}">${current.getNome()}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="preco"><fmt:message key="criar.voo.titulo.preco" /></label>
              <div class="controls">
                <input id="preco" class="span3 required number" name="preco" type="text" placeholder="<fmt:message key="criar.voo.titulo.preco" />">
              </div>
            </div>
            
            <div class="control-group">
              <div class="controls">
                <button type="submit" class="btn btn-success">
                  <fmt:message key="criar.voo.botao.cadastrar" />
                </button>
              </div>
            </div>
          </form>

        </div>
        </div>

      <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
  var msgRequired = document.id('errorDeleteMsg').get('value');
  window.addEvent('domready', function() {
    
    new Request.HTML({
      method : 'get',
      url : '/moonjava-flight-web/base/voo/create',
      update : document.id('content')
    }).send();
    
    new FormValidate({
      required : msgRequired
    });
  });
  
  jQuery(function($){
	   $("#partida").mask("99/99/9999 99:99");
	   $("#chegada").mask("99/99/9999 99:99");
 });
</script>
</body>
</html>