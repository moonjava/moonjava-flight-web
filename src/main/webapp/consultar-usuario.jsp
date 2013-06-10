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

      <div class="row" style="width:980px; margin-left: 35px;">
        <div class="panel">
          <div id="container" class="panel-hd">
            <h4><fmt:message key="menubar.usuario" /></h4>

            <input id="codigo" class="span2" type="text" placeholder="<fmt:message key="consultar.usuario.titulo.codigo" />" />
            <input id="login" class="span2" type="text" placeholder="<fmt:message key="consultar.usuario.titulo.login" />" />

            <button id="refresh" class="btn btn-info"><i class="icon-refresh icon-white"></i> <fmt:message key="aeronave.limpar" /></button>
            <button id="update" class="btn btn-success"><i class="icon-ok-sign icon-white"></i> <fmt:message key="usuario.atualizar" /></button>
            <button id="delete" class="btn btn-danger"><i class="icon-trash icon-white"></i> <fmt:message key="usuario.deletar" /></button>

            <input type="hidden" id="errorDeleteMsg" value="<fmt:message key="consultar.usuario.joption.err.selecao" />">
            <div id="notification"></div>

          </div>

          <div id="content"></div> <!-- Aqui o JS exibe a tabela (usuario-table.jsp) quando carregado a pagina -->
        </div>
      </div>

      <!-- Modal para validar delete-->
      <div  id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel"><fmt:message key="deletar.joption.titulo" /></h3>
        </div>
        <div class="modal-body">
          <p><fmt:message key="deletar.usuario.joption.msg" /></p>
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
      page : '/moonjava-flight-web/consultar-usuario.jsp', // Pagina para refresh apos deletar item
      deleteUrl : '/moonjava-flight-web/base/usuario/del', // url para deletar
      deleteErrorMsg : msgDeleteError, // mensagem de erro
    });

    new PageSearch({
      id : 'content', // Local onde sera renderizado a consulta
      serviceUrl : '/moonjava-flight-web/base/usuario', // url da tabela de acordo com o filtro
      filter : { // Filtros de campos de textos
        origem : document.id('codigo').get('value'),
        destino : document.id('login').get('value'),

      }
    });

    new PageUpdate({
      id : 'content', // Local onde sera renderizado
      page : '/moonjava-flight-web/atualizar-usuario.jsp', // Pagina para refresh apos deletar item
      deleteErrorMsg : msgDeleteError, // mensagem de erro
    });

  });
</script>
</body>
</html>