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
            <h4><fmt:message key="menubar.passagem" /></h4>

            <input id="page" type="hidden" name="page" value="consulta">
            <input id="origem" name="origem" class="span2" type="text" placeholder="<fmt:message key="criar.voo.titulo.origem" />" />
            <input id="destino" name="destino" class="span2" type="text" placeholder="<fmt:message key="criar.voo.titulo.destino" />" />
            <input id="partida" name="partida" class="span2 datetime" type="text" placeholder="<fmt:message key="criar.voo.titulo.partida" />" />
            <input id="chegada" name="chegada" class="span2 datetime" type="text" placeholder="<fmt:message key="criar.voo.titulo.chegada" />" />

            <a id="refresh" class="btn btn-info"><i class="icon-refresh icon-white"></i> <fmt:message key="aeronave.limpar" /></a>
            <button id="update" class="btn btn-success"><i class="icon-ok-sign icon-white"></i> <fmt:message key="vender.passagem.botao.solicitarCompra" /></button>

            <input type="hidden" id="errorMsg" value="<fmt:message key="atualizar.voo.joption.err" />">
            <div id="notification"></div>

          </div>

          <div id="content"></div> <!-- Aqui o JS exibe a tabela (aeronave-table.jsp) quando carregado a pagina -->
        </div>
      </div>

      <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
var msgError = document.id('errorMsg').get('value');
  window.addEvent('domready', function() {
    new PageSearch({
      id : 'content', // Local onde sera renderizado a consulta
      serviceUrl : '/moonjava-flight-web/base/passagem/vender', // url da tabela de acordo com o filtro
      filter : { // Filtros de campos de textos
        origem : document.id('origem').get('value'),
        destino : document.id('destino').get('value'),
        partida : document.id('partida').get('value'),
        chegada : document.id('chegada').get('value'),
        page : document.id('page').get('value')
      }
    });
  });
  
  new PageUpdate({
    id : 'content', // Local onde sera renderizado
    page : '/moonjava-flight-web/passagem-vender.jsp', // Pagina para refresh apos deletar item
    deleteErrorMsg : msgError, // mensagem de erro
  });
  
  jQuery(function($) {
    $('.datetime').mask('99/99/9999 99:99', {
      placeholder : "_"
    });
  });

</script>
</body>
</html>