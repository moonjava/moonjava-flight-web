<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <input id="id" name="id" type="hidden" value="${aeronave.id}">
  <div class="control-group">
    <label class="control-label" for="codigo"><fmt:message key="criar.aeronave.titulo.codigo" /></label>
    <div class="controls">
      <input type="hidden" name="codigo" value="${aeronave.codigo}"> <span class="input-xlarge uneditable-input span3">${aeronave.codigo}</span>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="nome"><fmt:message key="criar.aeronave.titulo.nome" /></label>
    <div class="controls">
      <input id="nome" name="nome" value="${aeronave.nome}" class="span3 required" type="text" placeholder="<fmt:message key="criar.aeronave.titulo.nome" />">
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-success">
        <fmt:message key="atualizar.aeronave.botao.atualizar" />
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
</script>
</html>