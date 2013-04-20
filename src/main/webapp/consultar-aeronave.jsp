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

            <input type="hidden" id="errorDeleteMsg" value="<fmt:message key="aeronave.limpar" />">
            <input type="hidden" id="successDeleteMsg" value="<fmt:message key="aeronave.limpar" />">
            <div id="notification"></div>
            

          </div>

          <div id="content"></div> <!-- Aqui o JS exibe a tabela (aeronave-table.jsp) quando carregado a pagina -->
        </div>
      </div>
    
    <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
  window.addEvent('domready', function() {
    var msgDeleteError = document.id('errorDeleteMsg').get('value');
    var msgDeleteSuccess = document.id('successDeleteMsg').get('value');
    
    new PageDelete({
      id : 'content', // Local onde sera renderizado
      deleteUrl : '/moonjava-flight-web/base/aeronave/del', // url para deletar
      deleteErrorMsg : msgDeleteError, // mensagem de erro
      deleteSuccessMsg : msgDeleteSuccess
    });
    
    new PageSearch({
      id : 'content', // Local onde sera renderizado a consulta
      serviceUrl : '/moonjava-flight-web/base/aeronave', // url da tabela de acordo com o filtro
      filter : { // Filtros de campos de textos
        nome : document.id('nome').get('value'),
        codigo : document.id('codigo').get('value')
      }
    });
    
  });
</script>
</body>
</html>