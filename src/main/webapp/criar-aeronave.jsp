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
            <h4><fmt:message key="menubar.aeronave" /></h4>

            <input type="hidden" id="errorMsg" value="<fmt:message key="erro.campo.vazio" />">
            <div id="notification"></div>

          </div>

          <form id="form" action="/moonjava-flight-web/base/aeronave/create" method="POST" style="margin-top: 10px;" class="form-horizontal" enctype="multipart/form-data">

            <div id="content" class="control-group"></div>
            <div class="control-group">
              <label class="control-label" for="nome"><fmt:message key="criar.aeronave.titulo.nome" /></label>
              <div class="controls">
                <input id="nome" name="nome" class="span3 required" type="text" placeholder="<fmt:message key="criar.aeronave.titulo.nome" />">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="qtdDeAssento"><fmt:message key="criar.aeronave.titulo.assento" /></label>
              <div class="controls">
                <input id="qtdDeAssento" class="span3 required number" name="qtdDeAssento" type="text" placeholder="<fmt:message key="criar.aeronave.titulo.assento" />">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="imagem"><fmt:message key="criar.aeronave.botao.mapa" />:</label>
              <div class="controls">
                <input id="lefile" type="file" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem" style="display: none;" maxlength="60" tabindex="1" />
                <div class="input-append">
                  <input id="photoCover" class="input-large span3 required" type="text" placeholder="<fmt:message key="criar.aeronave.botao.mapa" />:"> <a class="btn" onclick="$('input[id=lefile]').click();"><fmt:message key="criar.aeronave.botao.mapa" /></a>
                </div>
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <button type="submit" class="btn btn-success">
                  <fmt:message key="criar.aeronave.botao.cadastrar" />
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
  var msgRequired = document.id('errorMsg').get('value');
  window.addEvent('domready', function() {
    $('input[id=lefile]').change(function() {
      $('#photoCover').val($(this).val());
    });
    
    new Request.HTML({
      method : 'get',
      url : '/moonjava-flight-web/base/aeronave/create',
      update : document.id('content')
    }).send();
    
    new FormValidate({
      required : msgRequired
    });
  });
</script>
</body>
</html>