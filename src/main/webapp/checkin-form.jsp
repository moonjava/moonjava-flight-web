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

        <div id="content"></div>


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

        <div>
            <img src="/moonjava-flight-web/base/aeronave/map/chart?id=${aeronave.id}">
        </div>

        <br>
        <br>
        <br>

        <div class="control-group">
            <form action="/moonjava-flight-web/base/checkin" method="POST" style="margin-top: 10px;" class="form-horizontal">
                <label class="control-label" for="assento"><fmt:message key="checkin.alocarAssento" /></label>
                <div class="controls">
                    <input id="assento" name="assento" class="span3 required" type="text">
                    <input id="bilhete" name="bilhete" value="${passagem.codigoBilhete}" type="hidden">
                </div>
                <br>
                <div class="controls">
                    <button id="transf" class="btn btn-success">
                        <i class="icon-ok-sign icon-white"></i>
                        <fmt:message key="checkin.alocarAssento" />
                    </button>
                </div>
            </form>
        </div>

        <c:if test="${not empty passagens}">
            <table class="table table-striped span2">
                <thead>
                    <tr>
                        <th><fmt:message key="checkin.assento.failed" /></th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="passagem" items="${passagens}" varStatus="id">
                        <c:if test="${not empty passagem}">
                            <tr>
                                <td>${passagem.assento}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

    </c:if>

</body>
<script type="text/javascript">
	
</script>
</html>