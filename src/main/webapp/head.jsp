<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="arquivo" />

<!DOCTYPE html>
<html lang="${language}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="/moonjava-flight-web/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/moonjava-flight-web/js/jquery.maskedinput-1.3.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/less-1.3.0.min.js"></script>

<script type="text/javascript" src="/moonjava-flight-web/js/mootools-core-1.4.5-full-compat.js"></script>

<script type="text/javascript" src="/moonjava-flight-web/js/FormValidate.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/PageDelete.js"></script>
<script type="text/javascript" src="/moonjava-flight-web/js/PageStatus.js"></script>
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
</head>
<body>

    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="brand">Flight :: Web</a>
                <ul class="nav nav-pills">
                    <li><a href="/moonjava-flight-web/">HOME</a></li>
                    <li class="dropdown" id="menu1"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><fmt:message key="menubar.passagem" /><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/moonjava-flight-web/vender-passagem.jsp"><fmt:message key="passagem.vender" /></a></li>
                            <li><a href="/moonjava-flight-web/cancelar-passagem.jsp"><fmt:message key="passagem.cancelar" /></a></li>
                            <li><a href="/moonjava-flight-web/transferir-passagem.jsp"><fmt:message key="passagem.transferir" /></a></li>
                        </ul></li>
                    <li class="dropdown" id="menu2"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><fmt:message key="menubar.voo" /><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/moonjava-flight-web/consultar-voo.jsp"><fmt:message key="voo.consultar" /></a></li>
                            <li><a href="/moonjava-flight-web/criar-voo.jsp"><fmt:message key="voo.cadastrar" /></a></li>
                            <li><a href="/moonjava-flight-web/controlar-status.jsp"><fmt:message key="voo.status" /></a></li>
                        </ul></li>
                    <li class="dropdown" id="menu2"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><fmt:message key="menubar.aeronave" /><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/moonjava-flight-web/consultar-aeronave.jsp"><fmt:message key="aeronave.consultar" /></a></li>
                            <li><a href="/moonjava-flight-web/criar-aeronave.jsp"><fmt:message key="aeronave.cadastrar" /></a></li>
                        </ul></li>
                    <li class="dropdown" id="menu2"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><fmt:message key="menubar.usuario" /><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/moonjava-flight-web/consultar-usuario.jsp"><fmt:message key="usuario.consultar" /></a></li>
                            <li><a href="/moonjava-flight-web/criar-usuario.jsp"><fmt:message key="usuario.cadastrar" /></a></li>
                        </ul></li>
                    <li><a href="/moonjava-flight-web/checkin.jsp">CHECK-IN</a></li>
                    <li><img src="/moonjava-flight-web/img/brazil-flag-icon.png" style="cursor: pointer; margin-top: 3px;" onclick="flightBundle('pt');"></li>
                    <li><img src="/moonjava-flight-web/img/us-united-states-flag-icon.png" style="cursor: pointer; margin-top: 3px;" onclick="flightBundle('en');"></li>
                    <li><img src="/moonjava-flight-web/img/spain-flag-icon.png" style="cursor: pointer; margin-top: 3px;" onclick="flightBundle('es');"></li>
                </ul>
                <form id="form-login" action="/moonjava-flight-web/base/login" method="get">
                    <input type="hidden" name="logout" value="logout">
                    <button class="btn btn-small btn-primary" type="submit">Logout</button>
                </form>
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
</body>
</html>