/*
 * Copyright 2012 MoonJava LTDA.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package br.com.moonjava.flight.controller.base;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.Usuario;
import br.com.moonjava.flight.model.base.UsuarioModel;
import br.com.moonjava.flight.util.EncryptPassword;
import br.com.moonjava.flight.util.FlightRequestWrapper;

/**
 * @version 1.0 Sep 7, 2012
 * @contact miqueias@moonjava.com.br
 * 
 */
@WebFilter("*.jsp")
@WebServlet(value = "/base/login")
public class LoginController extends HttpServlet implements Filter {

  private static final long serialVersionUID = 1L;
  private FlightCore core = FlightCore.getInstance();

  @Override
  public void destroy() {
  }

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
      IOException {
    // Encriptografia para senha utilizando codigos 'sun.misc.BASE64Encoder'
    FlightRequestWrapper wrapper = new FlightRequestWrapper(req);
    EncryptPassword encrypt = new EncryptPassword();
    if (wrapper.stringParam("pass") != null && wrapper.stringParam("login") != null
        && wrapper.stringParam("logout") == null) {
      Usuario usuarioLogado = new UsuarioModel().consultarUsuario(wrapper, encrypt.toEncryptMD5(wrapper.stringParam("pass")));
      core.setUsuarioLogado(usuarioLogado);
      if (usuarioLogado != null)
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
      else
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    } else {
      core.setUsuarioLogado(null);
      req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
  }

  @Override
  public void doFilter(ServletRequest req, ServletResponse resp,
      FilterChain chain) throws IOException, ServletException {
    core.logInfo("Iniciando autenticação");

    Usuario usuarioLogado = core.getUsuarioLogado();
    if (usuarioLogado != null) {
      core.logInfo("Usuario logado");
      chain.doFilter(req, resp);
    } else {
      core.logInfo("Usuario NAO logado");
      req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
  }

  @Override
  public void init(FilterConfig arg0) throws ServletException {
  }

}