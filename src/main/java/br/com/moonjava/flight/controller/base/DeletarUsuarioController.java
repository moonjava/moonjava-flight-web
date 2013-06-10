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
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.UsuarioModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;
import br.com.moonjava.flight.util.JSONObject;

/**
 * @version 1.0 Sep 5, 2012
 * @contact miqueias@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/usuario/del")
public class DeletarUsuarioController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("utf8");
    resp.setContentType("application/json");
    PrintWriter out = resp.getWriter();
    JSONObject obj = new JSONObject();

    FlightRequestWrapper wrapper = new FlightRequestWrapper(req);
    int id = wrapper.intParam("id");

    try {
      UsuarioModel usuarioModel = new UsuarioModel();
      usuarioModel.deletar(id);

      obj.put("success", "true");
    } catch (SQLException e) {
      obj.put("failure", "true");
      obj.put("exception", e);
      core.logError("SQL usuario has failed", e);
    }
    out.print(obj);
  }
}