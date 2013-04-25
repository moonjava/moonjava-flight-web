<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="br.com.moonjava.flight.model.base.Status"%>
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
            <h4><fmt:message key="menubar.voo" /></h4>

            <input id="status" name="status" class="span2" type="hidden" value="DISPONIVEL" />
            <input id="origem" class="span2" type="text" placeholder="<fmt:message key="consultar.voo.titulo.origem" />" />
            <input id="destino" class="span2" type="text" placeholder="<fmt:message key="consultar.voo.titulo.destino" />" />
            <input id="partida" class="span2" type="text" placeholder="<fmt:message key="consultar.voo.titulo.partida" />" />
            <input id="chegada" class="span2" type="text" placeholder="<fmt:message key="consultar.voo.titulo.chegada" />" />
            <c:set var="enumStatus" value="<%=Status.values()%>" />

            <c:if test="${language == 'pt'}">
              <select id="statusHidden" class="span2" title="<fmt:message key="consultar.voo.titulo.status" />">
                <c:forEach var="current" items="${enumStatus}">
                  <option value="${current}">${current.setName('pt')}</option>
                </c:forEach>
              </select>
            </c:if>
            <c:if test="${language == 'en'}">
              <select id="statusHidden" class="span2" title="<fmt:message key="consultar.voo.titulo.status" />">
                <c:forEach var="current" items="${enumStatus}">
                  <option value="${current}">${current.setName('en')}</option>
                </c:forEach>
              </select>
            </c:if>
            <c:if test="${language == 'es'}">
              <select id="statusHidden" class="span2" title="<fmt:message key="consultar.voo.titulo.status" />">
                <c:forEach var="current" items="${enumStatus}">
                  <option value="${current}">${current.setName('es')}</option>
                </c:forEach>
              </select>
            </c:if>

            <button id="refresh" class="btn btn-info"><i class="icon-refresh icon-white"></i> <fmt:message key="aeronave.limpar" /></button>
            <button id="update" class="btn btn-success"><i class="icon-ok-sign icon-white"></i> <fmt:message key="voo.atualizar" /></button>
            <button id="delete" class="btn btn-danger"><i class="icon-trash icon-white"></i> <fmt:message key="voo.deletar" /></button>

            <input type="hidden" id="errorDeleteMsg" value="<fmt:message key="consultar.voo.joption.err.selecao" />">
            <div id="notification"></div>

          </div>

          <div id="content"></div> <!-- Aqui o JS exibe a tabela (voo-table.jsp) quando carregado a pagina -->
        </div>
      </div>

      <!-- Modal para validar delete-->
      <div  id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel"><fmt:message key="deletar.joption.titulo" /></h3>
        </div>
        <div class="modal-body">
          <p><fmt:message key="deletar.voo.joption" /></p>
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
      page : '/moonjava-flight-web/consultar-voo.jsp', // Pagina para refresh apos deletar item
      deleteUrl : '/moonjava-flight-web/base/voo/del', // url para deletar
      deleteErrorMsg : msgDeleteError, // mensagem de erro
    });

    new PageSearch({
      id : 'content', // Local onde sera renderizado a consulta
      serviceUrl : '/moonjava-flight-web/base/voo', // url da tabela de acordo com o filtro
      filter : { // Filtros de campos de textos
        origem : document.id('origem').get('value'),
        destino : document.id('destino').get('value'),
        partida : document.id('partida').get('value'),
        chegada : document.id('chegada').get('value'),
        status : document.id('status').value

      }
    });

    new PageUpdate({
      id : 'content', // Local onde sera renderizado
      page : '/moonjava-flight-web/atualizar-voo.jsp', // Pagina para refresh apos deletar item
      deleteErrorMsg : msgDeleteError, // mensagem de erro
    });

    new PageDelete({
      id : 'content', // Local onde sera renderizado
      page : '/moonjava-flight-web/consultar-voo.jsp', // Pagina para refresh apos deletar item
      deleteUrl : '/moonjava-flight-web/base/voo/del', // url para deletar
      deleteErrorMsg : msgDeleteError, // mensagem de erro
    });

    document.id('statusHidden').addEvent('change', function() {
      document.id('status').value = document.id('statusHidden').get('value');
      var el =  $$('input');
      Array.each(el, function(key) {
        var json = {};
        for(var i = 0; i < el.length; i++) {
          json[el[i].id] = el[i].value;
        }
        new Request.HTML({
          method : 'get',
          url : '/moonjava-flight-web/base/voo',
          data : json,
          update : document.id('content')
        }).send();
      });
    });
  });

  jQuery(function($) {
    $("#partida").mask("99/99/9999 99:99");
    $("#chegada").mask("99/99/9999 99:99");
  });
</script>
</body>
</html>