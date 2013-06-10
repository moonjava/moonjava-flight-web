<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="br.com.moonjava.flight.util.FlightRequestWrapper"%>
<%@ page language="java" import="br.com.moonjava.flight.model.base.AeronaveModel"%>
<%@ page language="java" import="br.com.moonjava.flight.model.base.Perfil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
            <h4><fmt:message key="menubar.usuario" /></h4>

            <input type="hidden" id="errorDeleteMsg" value="<fmt:message key="erro.campo.vazio" />">
            <input type="hidden" id="cpfInvalid" value="<fmt:message key ="criar.pessoafisica.cpf.alerta.erro" />">
            <input type="hidden" id="cpfvalid" value="<fmt:message key ="criar.pessoafisica.cpf.alerta.ok" />">
            <div id="notification"></div>

          </div>

          <form id="form" action="/moonjava-flight-web/base/usuario/create" method="POST" style="margin-top: 10px;" class="form-horizontal">
			
			<input type="hidden" id="perfil" name="perfil" class="span2"  value="ATENDENTE" />
            <div id="content" class="control-group"></div>
            
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
                <input id="nascimento" class="span3" name="nascimento" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.nascimento" />">
              </div>
            </div>
            
            <div id="divcpf" class="control-group">
              <label class="control-label" for="cpf"><fmt:message key="criar.pessoafisica.titulo.cpf" /></label>
              <div class="controls">
                <input id="cpf" class="span3 required" name="cpf" type="text" onkeyup="validCPF();" placeholder="<fmt:message key="criar.pessoafisica.titulo.cpf" />">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="rg"><fmt:message key="criar.pessoafisica.titulo.rg" /></label>
              <div class="controls">
                <input id="rg" class="span3 required" name="rg" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.rg" />">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="endereco"><fmt:message key="criar.pessoafisica.titulo.endereco" /></label>
              <div class="controls">
                <input id="endereco" class="span3 required" name="endereco" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.endereco" />">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="telResidencial"><fmt:message key="criar.pessoafisica.titulo.telResidencial" /></label>
              <div class="controls">
                <input id="telResidencial" class="span3 required number" name="telResidencial" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.telResidencial" />">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="telCelular"><fmt:message key="criar.pessoafisica.titulo.telCelular" /></label>
              <div class="controls">
                <input id="telCelular" class="span3 required number" name="telCelular" type="text" placeholder="<fmt:message key="criar.pessoafisica.titulo.telCelular" />">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="email"><fmt:message key="criar.pessoafisica.titulo.email" /></label>
              <div class="controls">
                <input id="email" class="span3 required" name="email" type="email" placeholder="<fmt:message key="criar.pessoafisica.titulo.email" />">
              </div>
            </div>
            
            <c:set var="enumPerfil" value="<%=Perfil.values()%>" />
            <div class="control-group">
			  <label class="control-label" for="perfil"><fmt:message key="criar.usuario.titulo.perfil" /></label>
			  <div class="controls">
                <c:if test="${fn:contains(language, 'pt')}">
                  <select id="perfilHidden" class="span3" title="<fmt:message key="criar.usuario.titulo.perfil" />">
                    <c:forEach var="current" items="${enumPerfil}">
                      <option value="${current}">${current.setName('pt')}</option>
                    </c:forEach>
                  </select>
                </c:if>
                <c:if test="${fn:contains(language, 'en')}">
                  <select id="perfilHidden" class="span3" title="<fmt:message key="criar.usuario.titulo.perfil" />">
                    <c:forEach var="current" items="${enumPerfil}">
                      <option value="${current}">${current.setName('en')}</option>
                    </c:forEach>
                  </select>
                </c:if>
                <c:if test="${fn:contains(language, 'es')}">
                  <select id="perfilHidden" class="span3" title="<fmt:message key="criar.usuario.titulo.perfil" />">
                    <c:forEach var="current" items="${enumPerfil}">
                      <option value="${current}">${current.setName('es')}</option>
                    </c:forEach>
                  </select>
                </c:if>
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="login"><fmt:message key="criar.usuario.titulo.usuario" /></label>
              <div class="controls">
                <input id="login" class="span3 required" name="login" type="text" placeholder="<fmt:message key="criar.usuario.titulo.usuario" />">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="senha"><fmt:message key="criar.usuario.titulo.senha" /></label>
              <div class="controls">
                <input id="senha" class="span3 required" name="senha" type="password" placeholder="<fmt:message key="criar.usuario.titulo.senha" />">
              </div>
            </div>

            <div class="control-group">
              <div class="controls">
                <button id="btnRegister" type="submit" class="btn btn-success">
                  <fmt:message key="criar.usuario.botao.cadastrar" />
                </button>
              </div>
            </div>
          </form>

        </div>
        </div>

      <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
  var msgRequired = document.id('errorDeleteMsg').get('value');
  window.addEvent('domready', function() {
    
    new Request.HTML({
      method : 'get',
      url : '/moonjava-flight-web/base/usuario/create',
      update : document.id('content')
    }).send();
    
    new FormValidate({
      required : msgRequired
    });
    
    document.id('perfilHidden').addEvent('change', function() {
      document.id('perfil').value = document.id('perfilHidden').get('value');
    });
    
  });
  
  function validCPF(){
    if(document.id('cpf').value.contains('_') == false){
   	  var vcpf = document.id('cpf').value.replace('.','').replace('.','').replace('-','');
      if (vercpf(vcpf)) {
   		document.id('divcpf').removeClass('error');
   		document.id('divcpf').addClass('success');
   		document.id('cpf').setProperty('title', document.id('cpfvalid').value);
   		document.id('btnRegister').removeClass('disabled');
   		document.id('btnRegister').disabled = false;
	  } else {
   		document.id('divcpf').addClass('error');
   		document.id('divcpf').removeClass('success');
   		document.id('cpf').setProperty('title', document.id('cpfInvalid').value);
   		document.id('btnRegister').addClass('disabled');
   		document.id('btnRegister').disabled = true;
      }
    }
  }
	  
  function vercpf(cpf) {
	if (cpf.length != 11 
			|| cpf == "00000000000" || cpf == "11111111111"
			|| cpf == "22222222222" || cpf == "33333333333"
			|| cpf == "44444444444" || cpf == "55555555555"
			|| cpf == "66666666666" || cpf == "77777777777"
			|| cpf == "88888888888" || cpf == "99999999999") {
		return false;
	}
	add = 0;
	for (i = 0; i < 9; i++) {
		add += parseInt(cpf.charAt(i)) * (10 - i);
	}
	rev = 11 - (add % 11);
	if (rev == 10 || rev == 11) {
		rev = 0;
	}
	if (rev != parseInt(cpf.charAt(9))) {
		return false;
	}
	add = 0;
	for (i = 0; i < 10; i++) {
		add += parseInt(cpf.charAt(i)) * (11 - i);
	}
	rev = 11 - (add % 11);
	if (rev == 10 || rev == 11) {
		rev = 0;
	}
	if (rev != parseInt(cpf.charAt(10))) {
		return false;
	}
	return true;
  }

  jQuery(function($) {
      $("#cpf").mask("999.999.999-99", {
	  	placeholder : "_"
	  });
      $("#nascimento").mask("99/99/9999");
  });
</script>
</body>
</html>