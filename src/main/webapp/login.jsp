<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="/moonjava-flight-web/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/moonjava-flight-web/js/jquery.maskedinput-1.3.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/less-1.3.0.min.js"></script>

<script type="text/javascript" src="/moonjava-flight-web/js/mootools-core-1.4.5-full-compat.js"></script>

<script type="text/javascript" src="/moonjava-flight-web/js/FormValidate.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/PageDelete.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/PageSearch.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/PageMap.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/PageUpdate.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/PagePassagem.js"></script>

<link rel="stylesheet" type="text/css" href="/moonjava-flight-web/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/moonjava-flight-web/css/styles.css">

<script type="text/javascript">
	function flightBundle(value) {
		if (value == 'en') {
			document.getElementById('language').value = 'en';
		} else if (value == 'pt') {
			document.getElementById('language').value = 'pt';
		} else {
			document.getElementById('language').value = 'es';
		}
		var frm = document.getElementById('form-lang');
		frm.submit();
	}
</script>

<title>Flight :: Web</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<style type="text/css">
body {
				padding-top: 40px;
				padding-bottom: 40px;
				background-color: #f5f5f5;
}

.form-signin {
				max-width: 300px;
				padding: 19px 29px 29px;
				margin: 0 auto 20px;
				background-color: #fff;
				border: 1px solid #e5e5e5;
				-webkit-border-radius: 5px;
				-moz-border-radius: 5px;
				border-radius: 5px;
				-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
				-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
				box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
				margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
				font-size: 16px;
				height: auto;
				margin-bottom: 15px;
				padding: 7px 9px;
}
</style>
</head>

<body>

    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="brand">Flight :: Web</a>
                <ul class="nav nav-pills">
                    <li><img src="/moonjava-flight-web/img/brazil-flag-icon.png" style="cursor: pointer; margin-top: 3px;" onclick="flightBundle('pt');"></li>
                    <li><img src="/moonjava-flight-web/img/us-united-states-flag-icon.png" style="cursor: pointer; margin-top: 3px;" onclick="flightBundle('en');"></li>
                    <li><img src="/moonjava-flight-web/img/spain-flag-icon.png" style="cursor: pointer; margin-top: 3px;" onclick="flightBundle('es');"></li>
                </ul>
                <form id="form-lang" style="display: none;">
                    <select id="language" name="language">
                        <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
                        <option value="pt" ${language == 'pt' ? 'selected' : ''}>Portugues</option>
                        <option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
                    </select>
                </form>
            </div>
        </div>
    </div>

    <div class="container">
        <form class="form-signin" action="/moonjava-flight-web/base/login" method="POST">
            <h2 class="form-signin-heading"><fmt:message key="login.titulo" /></h2>
            <input type="text" name="login" class="input-block-level" placeholder="<fmt:message key="login.titulo.usuario" />"> 
            <input type="password" name="pass" class="input-block-level" placeholder="<fmt:message key="login.titulo.senha" /> "> 
            <button class="btn btn-large btn-primary" type="submit"><fmt:message key="login.botao.entrar" /></button>
        </form>
        <c:import url="footer.jsp" />
    </div>
    <!-- /container -->

</body>
</html>