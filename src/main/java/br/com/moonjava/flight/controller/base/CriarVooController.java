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
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.Voo;
import br.com.moonjava.flight.model.base.VooModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;
import br.com.moonjava.flight.util.GerarCodigo;

/**
 * @version 1.0 Aug 29, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/voo/create")
public class CriarVooController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();
  private String codigo;

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    FlightRequestWrapper request = new FlightRequestWrapper(req);

    Voo pojo = new VooCreate(request).createInstance();
    try {
      new VooModel().criar(pojo);
      req.getRequestDispatcher("/consultar-voo.jsp").forward(req, resp);
    } catch (SQLException e) {
      core.logError("SQL Error", e);
    }

  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    codigo = new GerarCodigo("VOO").getCodigo();
    req.setAttribute("codigo", codigo);
    req.getRequestDispatcher("/codigo.jsp").forward(req, resp);
  }

  public String getCodigo() {
    return codigo;
  }
}