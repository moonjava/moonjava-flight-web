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
import br.com.moonjava.flight.model.base.Passagem;
import br.com.moonjava.flight.model.base.PassagemModel;
import br.com.moonjava.flight.model.base.Reembolso;
import br.com.moonjava.flight.model.base.ReembolsoModel;
import br.com.moonjava.flight.model.base.VooModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;

/**
 * @version 1.0 Aug 31, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/passagem/cancelar")
public class CancelarPassagemController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    PassagemModel passagemModel = new PassagemModel();

    FlightRequestWrapper request = new FlightRequestWrapper(req);
    String codBilhete = request.stringParam("bilhete");

    Passagem passagem = passagemModel.consultarPorCodigoBilhete(codBilhete);
    if (passagem != null) {
      String voo = passagem.getVoo().getCodigo();
      if (voo != null) {
        PassagemModel pasModel = new PassagemModel();
        double reembolso = pasModel.getPreco(passagem);

        if (reembolso > 0.0) {
          req.setAttribute("valor", String.format("%.2f", reembolso));
          req.setAttribute("passagem", passagem);
        } else if (reembolso == 0.0) {
          req.setAttribute("passagem", passagem);
          req.setAttribute("response", "zero");
        } else {
          req.setAttribute("response", "finished");
        }
      } else {
        req.setAttribute("response", "canceled");
      }
    } else {
      req.setAttribute("response", "notFound");
    }
    req.getRequestDispatcher("/passagem-form-cancelar.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    ReembolsoModel model = new ReembolsoModel();
    PassagemModel modelPassagem = new PassagemModel();
    FlightRequestWrapper request = new FlightRequestWrapper(req);

    if (request.stringParam("valor") != null) {
      Reembolso reembolso = new ReembolsoCreate(request).createInstance();
      try {
        model.criar(reembolso);
      } catch (SQLException e) {
        core.logError("Generic Error", e);
        req.setAttribute("exception", "Error on server " + e);
        req.getRequestDispatcher("/erro.jsp").forward(req, resp);
      }
    }

    try {
      Passagem _passagem = modelPassagem.consultarPorId(request.intParam("passagem"));
      modelPassagem.efetuarCancelamento(_passagem);
      new VooModel().incrementarAssento(_passagem.getVoo().getId());
      req.getRequestDispatcher("/cancelar-passagem.jsp").forward(req, resp);

    } catch (SQLException e) {
      core.logError("Generic Error", e);
      req.setAttribute("exception", "Error on server " + e);
      req.getRequestDispatcher("/erro.jsp").forward(req, resp);
    }
  }

}