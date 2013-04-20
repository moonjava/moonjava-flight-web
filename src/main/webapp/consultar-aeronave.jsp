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
            <button id="update" class="btn btn-success"><i class="icon-ok-sign icon-white"></i> <fmt:message key="aeronave.atualizar" /></button>
            <button id="delete" class="btn btn-danger"><i class="icon-trash icon-white"></i> <fmt:message key="aeronave.deletar" /></button>
            <button id="delete" class="btn btn-primary pull-right"><i class="icon-plane icon-white"></i> <fmt:message key="consultar.aeronave.botao.mapa" /></button>

            <input type="hidden" id="errorDeleteMsg" value="<fmt:message key="consultar.joption.erro" />">
            <div id="notification"></div>

          </div>

          <div id="content"></div> <!-- Aqui o JS exibe a tabela (aeronave-table.jsp) quando carregado a pagina -->
        </div>
      </div>

      <!-- Modal para validar delete-->
      <div  id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel"><fmt:message key="deletar.joption.titulo" /></h3>
        </div>
        <div class="modal-body">
          <p><fmt:message key="deletar.joption.msg" /></p>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true"><fmt:message key="cancelar" /></button>
          <button id="delete-ok" class="btn btn-primary" style="margin-bottom: 10px;">Ok</button>
        </div>
      </div>

      <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
  window.addEvent('domready', function() {
    var msgDeleteError = document.id('errorDeleteMsg').get('value');
    
    new PageDelete({
      id : 'content', // Local onde sera renderizado
      page : '/moonjava-flight-web/consultar-aeronave.jsp', // Pagina para refresh apos deletar item
      deleteUrl : '/moonjava-flight-web/base/aeronave/del', // url para deletar
      deleteErrorMsg : msgDeleteError, // mensagem de erro
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