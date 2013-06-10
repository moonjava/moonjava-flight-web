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
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.Usuario;
import br.com.moonjava.flight.model.base.UsuarioModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;

/**
 * @version 1.0 Jun 9, 2013
 * @contact miqueias@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/usuario")
public class ConsultarUsuarioController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();
  private List<Usuario> usuarios;

  @Override
  public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

    FlightRequestWrapper wrapper = new FlightRequestWrapper(req);
    usuarios = new UsuarioModel().consultar(wrapper);

    req.setAttribute("usuarios", usuarios);
    req.getRequestDispatcher("/usuario-table.jsp").forward(req, res);
  }

  public List<Usuario> getUsuarios() {
    return usuarios;
  }
}