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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.Voo;
import br.com.moonjava.flight.model.base.VooModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;
import br.com.moonjava.flight.util.FormatDateTime;

/**
 * @version 1.0 Aug 30, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/voo/update")
public class AtualizarVooController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    FlightRequestWrapper request = new FlightRequestWrapper(req);
    Voo voo = new VooUpdate(request).createInstance();
    try {
      new VooModel().atualizar(voo);
      req.getRequestDispatcher("/consultar-voo.jsp").forward(req, resp);
    } catch (Exception e) {
      core.logError("SQL Error", e);
      req.setAttribute("exception", e);
      req.getRequestDispatcher("/erro.jsp").forward(req, resp);
    }

  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    FlightRequestWrapper wrapper = new FlightRequestWrapper(req);
    Integer id = wrapper.intParam("id");

    Voo voo = new VooModel().consultarPorId(id);
    req.setAttribute("voo_id", voo.getId());
    req.setAttribute("voo_codigo", voo.getCodigo());
    req.setAttribute("voo_partida", FormatDateTime.parseToStringDateTime(voo.getDataDePartida().toString(), req.getLocale().getCountry()));
    req.setAttribute("voo_chegada", FormatDateTime.parseToStringDateTime(voo.getDataDeChegada().toString(), req.getLocale().getCountry()));
    req.setAttribute("voo_observacao", voo.getObservacao());
    req.getRequestDispatcher("/voo-form-update.jsp").forward(req, resp);
  }

}