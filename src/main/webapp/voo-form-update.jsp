<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <input id="id" name="id" type="hidden" value="${voo_id}">
  <div class="control-group">
    <label class="control-label" for="codigo"><fmt:message key="criar.voo.titulo.codigo" /></label>
    <div class="controls">
      <input type="hidden" name="codigo" value="${voo_codigo}"> <span class="input-xlarge uneditable-input span3">${voo_codigo}</span>
    </div>
  </div>
 
  <div class="control-group">
    <label class="control-label" for="partida"><fmt:message key="criar.voo.titulo.partida" /></label>
    <div class="controls">
      <input id="partida" class="span3 required" name="partida" type="text" value="${voo_partida}" placeholder="<fmt:message key="criar.voo.titulo.partida" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="chegada"><fmt:message key="criar.voo.titulo.chegada" /></label>
    <div class="controls">
      <input id="chegada" class="span3 required" name="chegada" type="text" value="${voo_chegada}" placeholder="<fmt:message key="criar.voo.titulo.chegada" />">
    </div>
  </div>
  
  <div class="control-group">
    <label class="control-label" for="observacao"><fmt:message key="criar.voo.titulo.observacao" /></label>
    <div class="controls">
      <input id="observacao" class="span3 required" name="observacao" type="text" value="${voo_observacao}" placeholder="<fmt:message key="criar.voo.titulo.observacao" />">
    </div>
  </div>
            
  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-success">
        <fmt:message key="atualizar.voo.botao.atualizar" />
      </button>
    </div>
  </div>

</body>
<script type="text/javascript">
window.addEvent('domready', function() {
    new FormValidate({
      required : msgRequired
    });
});

jQuery(function($){
	   $("#partida").mask("99/99/9999 99:99");
	   $("#chegada").mask("99/99/9999 99:99");
});
</script>
</html>