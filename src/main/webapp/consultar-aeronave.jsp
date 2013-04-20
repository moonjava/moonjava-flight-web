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
            <h4><fmt:message key="menubar.aeronave" /></h4>

            <input id="codigo" class="span2" type="text" placeholder="<fmt:message key="criar.aeronave.titulo.codigo" />" />
            <input id="nome" class="span2" type="text" placeholder="<fmt:message key="criar.aeronave.titulo.nome" />" /> 

            <button id="refresh" class="btn btn-info"><i class="icon-refresh icon-white"></i> <fmt:message key="aeronave.limpar" /></button>
            <button id="update" class="btn btn-success pull-right"><i class="icon-ok-sign icon-white"></i> <fmt:message key="aeronave.atualizar" /></button>
            <button id="delete" class="btn btn-danger"><i class="icon-trash icon-white"></i> <fmt:message key="aeronave.deletar" /></button>

            <div id="error"></div>
            <input type="hidden" id="errorDeleteMsg" value="<fmt:message key="aeronave.limpar" />">

          </div>

          <div id="content"></div>
        </div>
      </div>
    
    <c:import url="footer.jsp" />
    </div>
  </div>


<script type="text/javascript">
  window.addEvent('domready', function() {
    var msgDelete = document.id('errorDeleteMsg').get('value');
    var p = new Page({
      id : 'content',
      page : '/moonjava-flight-web/consultar-aeronave.jsp',
      serviceUrl : '/moonjava-flight-web/base/aeronave',
      deleteUrl : '/moonjava-flight-web/base/aeronave/del',
      deleteErrorMsg : msgDelete
    });
    
    search = function() {
      return obj = {
          nome : document.id('nome').get('value'),
          codigo : document.id('codigo').get('value')
      }
    }
    
    var el = document.getElementsByTagName('input');
    Array.each(el, function(key) {
      key.addEvent('keyup', function() {
        p.finder(search());
      });
    });
    
  });
</script>
</body>
</html>