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
            <h4><fmt:message key="menubar.usuario" /></h4>

            <input type="hidden" id="errorMsg" value="<fmt:message key="erro.campo.vazio" />">
            <div id="notification"></div>

          </div>

          <form id="form" action="/moonjava-flight-web/base/usuario/update" method="POST" style="margin-top: 10px;" class="form-horizontal">
            <div id="content"></div>
          </form>

        </div>
      </div>

      <c:import url="footer.jsp" />
    </div>
  </div>

<script type="text/javascript">
  var msgRequired = document.id('errorMsg').get('value');

  var prmstr = window.location.search.substr(1);
  var prmarr = prmstr.split("&");
  var params = {};

  for ( var i = 0; i < prmarr.length; i++) {
    var tmparr = prmarr[i].split("=");
    params[tmparr[0]] = tmparr[1];
  }

  window.addEvent('domready', function() {
    new Request.HTML({
      method : 'get',
      url : '/moonjava-flight-web/base/usuario/update',
      data : params,
      update : document.id('content')
    }).send();

  });
  
  function validCPF(){
    if(document.id('cpf').value.contains('_') == false){
    	var vcpf = document.id('cpf').value.replace('.','').replace('.','').replace('-','');
    	if (vercpf(vcpf)) {
    		document.id('divcpf').removeClass('error');
    		document.id('divcpf').addClass('success');
    		document.id('cpf').setProperty('title', document.id('cpfvalid').value);
    		document.id('transf').removeClass('disabled');
    		document.id('transf').disabled = false;
    	} else {
    		document.id('divcpf').addClass('error');
	   		document.id('divcpf').removeClass('success');
    		document.id('cpf').setProperty('title', document.id('cpfInvalid').value);
    		document.id('transf').addClass('disabled');
    		document.id('transf').disabled = true;
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
      $("#cpf").mask("999.999.999-99");
      $("#nascimento").mask("99/99/9999");
  });
</script>
</body>
</html>