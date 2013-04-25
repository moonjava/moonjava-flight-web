<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <c:if test="${response == 'notFound'}">
    <h4>
      <fmt:message key="cancelar.passagem.erro.solicitacao" />
    </h4>
  </c:if>

  <c:if test="${response == 'canceled'}">
    <h4>
      <fmt:message key="cancelar.passagem.ja.cancelada" />
    </h4>
  </c:if>

  <c:if test="${response == 'finished'}">
    <h4>
      <fmt:message key="cancelar.passagem.voo.realizado" />
    </h4>
  </c:if>

  <c:if test="${response == 'zero'}">
    <h4>
      <fmt:message key="cancelar.passagem.reembolso.zero" />
    </h4>

    <div class="control-group">
      <label class="control-label" for="valor"><fmt:message key="cancelar.passagem.titulo" /></label>
      <div class="controls">
        <input type="hidden" name="passagem" value="${passagem.id}"> <span class="input-xlarge uneditable-input span3">${passagem.codigoBilhete}</span>
      </div>
    </div>
    <div class="control-group">
      <div class="controls">
        <button id="transf" class="btn btn-success">
          <i class="icon-ok-sign icon-white"></i>
          <fmt:message key="cancelar.passagem.cancelar" />
        </button>
      </div>
    </div>
  </c:if>

  <c:if test="${not empty valor}">
    <div class="control-group">
      <label class="control-label" for="valor"><fmt:message key="cancelar.passagem.titulo" /></label>
      <div class="controls">
        <input type="hidden" name="passagem" value="${passagem.id}"> <span class="input-xlarge uneditable-input span3">${passagem.codigoBilhete}</span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="valor"><fmt:message key="cancelar.passagem.titulo.valor" /></label>
      <div class="controls">
        <input type="hidden" name="valor" value="${valor}"> <span class="input-xlarge uneditable-input span3"><fmt:message key="cancelar.passagem.label.moeda" /> ${valor}</span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="titular"><fmt:message key="cancelar.passagem.titulo.nometitular" /></label>
      <div class="controls">
        <input id="titular" name="titular" class="span3 required" type="text" placeholder="<fmt:message key="cancelar.passagem.titulo.nometitular" />">
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="cpf"><fmt:message key="cancelar.passagem.titulo.cpf" /></label>
      <div class="controls">
        <input id="cpf" name="cpf" class="span3 required cpf" type="text" placeholder="<fmt:message key="cancelar.passagem.titulo.cpf" />">
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="banco"><fmt:message key="cancelar.passagem.titulo.banco" /></label>
      <div class="controls">
        <input id="banco" name="banco" class="span3 required number" type="text" placeholder="<fmt:message key="cancelar.passagem.titulo.banco" />">
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="agencia"><fmt:message key="cancelar.passagem.titulo.agencia" /></label>
      <div class="controls">
        <input id="agencia" name="agencia" class="span3 required number" type="text" placeholder="<fmt:message key="cancelar.passagem.titulo.agencia" />">
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="conta"><fmt:message key="cancelar.passagem.titulo.conta" /></label>
      <div class="controls">
        <input id="conta" name="conta" class="span3 required number" type="text" placeholder="<fmt:message key="cancelar.passagem.titulo.conta" />">
      </div>
    </div>

    <div class="control-group">
      <div class="controls">
        <button id="transf" class="btn btn-success">
          <i class="icon-ok-sign icon-white"></i>
          <fmt:message key="cancelar.passagem.cancelar" />
        </button>
      </div>
    </div>
  </c:if>

</body>
<script type="text/javascript">
  var msgRequired = document.id('errorMsg').get('value');
  window.addEvent('domready', function() {
    new FormValidate({
      required : msgRequired
    });
  });

  jQuery(function($) {
    $(".cpf").mask("999.999.999-99", {
      placeholder : "_"
    });
  });
  
  jQuery(function($) {
    $(".number").keyup(function() {
      this.value = this.value.replace(/[^0-9\.]/g,'');
    });
  });
</script>
</html>