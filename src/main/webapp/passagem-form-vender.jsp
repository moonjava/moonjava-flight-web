<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<body>

  <div class="control-group">
    <label class="control-label" for="codigo"><fmt:message key="vender.passagem.codigo" /></label>
    <div class="controls">
      <input type="hidden" name="codigo" value="${codigo}"> <span class="input-xlarge uneditable-input span3">${codigo}</span>
      <input id="preco" type="hidden" value="${voo.preco}">
      <input name="vooId" type="hidden" value="${voo.id}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="codigo"><fmt:message key="vender.passagem.titulo.tipo" /></label>
    <div class="controls">
      <c:if test="${language == 'pt'}">
        <select id="tipo" name="tipo" class="span3">
          <option value="ADULTO">${adulto.setName('pt')}</option>
          <option value="CRIANCA">${crianca.setName('pt')}</option>
          <option value="BEBE">${bebe.setName('pt')}</option>
        </select>
      </c:if>

      <c:if test="${language == 'en'}">
        <select id="tipo" name="tipo" class="span3">
          <option value="ADULTO">${adulto.setName('en')}</option>
          <option value="CRIANCA">${crianca.setName('en')}</option>
          <option value="BEBE">${bebe.setName('en')}</option>
        </select>
      </c:if>

      <c:if test="${language == 'es'}">
        <select id="tipo" name="tipo" class="span3">
          <option value="ADULTO">${adulto.setName('es')}</option>
          <option value="CRIANCA">${crianca.setName('es')}</option>
          <option value="BEBE">${bebe.setName('es')}</option>
        </select>
      </c:if>
    </div>
  </div>
  <div class="control-group">
      <label class="control-label" for="valor"><fmt:message key="cancelar.passagem.titulo.valor" /> <fmt:message key="cancelar.passagem.label.moeda" /></label>
      <div class="controls">
        <input id="valor" type="hidden" name="valor"> <span id="valorSpan" class="input-xlarge uneditable-input span3"></span>
      </div>
    </div>
  <div class="control-group">
    <label class="control-label" for="nome"><fmt:message key="criar.pessoafisica.titulo.nome" /></label>
    <div class="controls">
      <input id="nome" name="nome" class="span3 required" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.nome" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="sobrenome"><fmt:message key="criar.pessoafisica.titulo.sobrenome" /></label>
    <div class="controls">
      <input id="sobrenome" name="sobrenome" class="span3 required" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.sobrenome" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="nascimento"><fmt:message key="criar.pessoafisica.titulo.nascimento" /></label>
    <div class="controls">
      <input id="nascimento" name="nascimento" class="span3 required date" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.nascimento" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="cpf"><fmt:message key="criar.pessoafisica.titulo.cpf" /></label>
    <div class="controls">
      <input id="cpf" name="cpf" class="span3 required cpf" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.cpf" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="rg"><fmt:message key="criar.pessoafisica.titulo.rg" /></label>
    <div class="controls">
      <input id="rg" name="rg" class="span3 required" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.rg" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="endereco"><fmt:message key="criar.pessoafisica.titulo.endereco" /></label>
    <div class="controls">
      <input id="endereco" name="endereco" class="span3 required" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.endereco" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="telResidencial"><fmt:message key="criar.pessoafisica.titulo.telResidencial" /></label>
    <div class="controls">
      <input id="telResidencial" name="telResidencial" class="span3 required number" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.telResidencial" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="telCelular"><fmt:message key="criar.pessoafisica.titulo.telCelular" /></label>
    <div class="controls">
      <input id="telCelular" name="telCelular" class="span3 required number" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.telCelular" />">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="email"><fmt:message key="criar.pessoafisica.titulo.email" /></label>
    <div class="controls">
      <input id="email" name="email" class="span3 required" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.email" />">
    </div>
  </div>
    <div class="control-group">
    <label class="control-label" for="tratamento"><fmt:message key="vender.passagem.titulo.tratamento" /></label>
    <div class="controls">
      <c:if test="${language == 'pt'}">
        <select id="tratamento" name="tratamento" class="span3">
          <option value="SR">${sr.setName('pt')}</option>
          <option value="SRA">${sra.setName('pt')}</option>
          <option value="SRTA">${srta.setName('pt')}</option>
        </select>
      </c:if>

      <c:if test="${language == 'en'}">
        <select id="tratamento" name="tratamento" class="span3">
          <option value="SR">${sr.setName('en')}</option>
          <option value="SRA">${sra.setName('en')}</option>
          <option value="SRTA">${srta.setName('en')}</option>
        </select>
      </c:if>

      <c:if test="${language == 'es'}">
        <select id="tratamento" name="tratamento" class="span3">
          <option value="SR">${sr.setName('es')}</option>
          <option value="SRA">${sra.setName('es')}</option>
          <option value="SRTA">${srta.setName('es')}</option>
        </select>
      </c:if>
    </div>
  </div>
  
  <div class="control-group">
    <div class="controls">
      <button id="transf" class="btn btn-success">
        <i class="icon-ok-sign icon-white"></i>
        <fmt:message key="vender.passagem.botao.concluir" />
      </button>
    </div>
  </div>

</body>
<script type="text/javascript">
  var msgRequired = document.id('errorMsg').get('value');
  window.addEvent('domready', function() {
    new FormValidate({
      required : msgRequired
    });
    
    if(document.id('tipo').selectedIndex == 0){
      var preco = parseFloat(document.id('preco').get('value'));
      document.id('valor').value = (preco + (0.07 * preco)).toFixed(2);
      document.id('valorSpan').innerHTML = (preco + (0.07 * preco)).toFixed(2);
    } else if(document.id('tipo').selectedIndex == 1) {
      var preco = document.id('preco').get('value');
      var taxa = 0.07 * preco;
      document.id('valor').value = (0.7 * preco + taxa).toFixed(2);
      document.id('valorSpan').innerHTML = (0.7 * preco + taxa).toFixed(2);
    } else {
      document.id('valor').value = parseFloat(0).toFixed(2);
      document.id('valorSpan').innerHTML = parseFloat(0).toFixed(2);
    }
    
    document.id('tipo').addEvent('change', function() {
      if(document.id('tipo').selectedIndex == 0){
        var preco = parseFloat(document.id('preco').get('value'));
        document.id('valor').value = (preco + (0.07 * preco)).toFixed(2);
        document.id('valorSpan').innerHTML = (preco + (0.07 * preco)).toFixed(2);
      } else if(document.id('tipo').selectedIndex == 1) {
        var preco = document.id('preco').get('value');
        var taxa = 0.07 * preco;
        document.id('valor').value = (0.7 * preco + taxa).toFixed(2);
        document.id('valorSpan').innerHTML = (0.7 * preco + taxa).toFixed(2);
      } else {
        document.id('valor').value = parseFloat(0).toFixed(2);
        document.id('valorSpan').innerHTML = parseFloat(0).toFixed(2);
      }
    });
    
  });

  jQuery(function($) {
    $(".cpf").mask("999.999.999-99", {
      placeholder : "_"
    });
  });

  jQuery(function($) {
    $(".date").mask("99/99/9999", {
      placeholder : "_"
    });
  });

  jQuery(function($) {
    $(".number").keyup(function() {
      this.value = this.value.replace(/[^0-9\.]/g, '');
    });
  });
</script>
</html>