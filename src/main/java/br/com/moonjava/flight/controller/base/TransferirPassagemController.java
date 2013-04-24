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
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.Passagem;
import br.com.moonjava.flight.model.base.PassagemModel;
import br.com.moonjava.flight.model.base.Status;
import br.com.moonjava.flight.model.base.Voo;
import br.com.moonjava.flight.model.base.VooModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;
import br.com.moonjava.flight.util.JSONObject;
import br.com.moonjava.flight.util.RequestParamWrapper;

/**
 * @version 1.0 Aug 31, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/passagem/transferir")
public class TransferirPassagemController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    FlightRequestWrapper wrapper = new FlightRequestWrapper(req);
    RequestParamWrapper reqWrapper = new RequestParamWrapper();

    PassagemModel passagem = new PassagemModel();
    VooModel _voo = new VooModel();

    Passagem pojo = passagem.consultarPorCodigoBilhete(wrapper.stringParam("bilhete").toUpperCase());
    if (pojo != null) {
      Voo voo = pojo.getVoo();
      if (voo != null) {
        Status status = Status.DISPONIVEL;
        reqWrapper.set("status", status);
        reqWrapper.set("assento", 0);

        List<Voo> voos = _voo.consultar(reqWrapper);
        req.setAttribute("voos", voos);
      }
    } else {
      req.setAttribute("voos", null);
    }
    req.getRequestDispatcher("/passagem-table.jsp").forward(req, resp);

  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("utf8");
    resp.setContentType("application/json");
    PrintWriter out = resp.getWriter();
    JSONObject obj = new JSONObject();

    FlightRequestWrapper wrapper = new FlightRequestWrapper(req);
    Integer id = wrapper.intParam("id");
    String codigo = wrapper.stringParam("codigo");

    try {
      VooModel voo = new VooModel();
      PassagemModel passagem = new PassagemModel();

      Passagem _passagem = passagem.consultarPorCodigoBilhete(codigo);
      Voo _voo = voo.consultarPorId(id);

      Passagem pojo = new PassagemUpdate(_passagem, _voo).createInstance();
      boolean updated = passagem.transferir(pojo);

      if (updated) {
        voo.incrementarAssento(_passagem.getVoo().getId());
        voo.decrementarAssento(_voo.getId());
      }

      obj.put("success", "true");
    } catch (SQLException e) {
      obj.put("failure", "true");
      obj.put("exception", e);
      core.logError("SQL Aeronave has failed", e);
    }
    out.print(obj);
  }

}