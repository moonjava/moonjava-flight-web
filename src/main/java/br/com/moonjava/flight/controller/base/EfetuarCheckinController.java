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
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.Passagem;
import br.com.moonjava.flight.model.base.PassagemModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;

/**
 * @version 1.0 Sep 8, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/checkin")
public class EfetuarCheckinController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
      IOException {
    PassagemModel passagemModel = new PassagemModel();

    FlightRequestWrapper request = new FlightRequestWrapper(req);
    String codBilhete = request.stringParam("bilhete");

    Passagem passagem = passagemModel.consultarPorCodigoBilhete(codBilhete);
    if (passagem != null) {
      List<Passagem> passagens = new PassagemModel().consultarPorVoo(passagem.getVoo());
      req.setAttribute("passagens", passagens);
      req.setAttribute("valor", String.format("%.2f", passagem.getPreco(passagem)));
      req.setAttribute("passagem", passagem);
      req.setAttribute("aeronave", passagem.getVoo().getAeronave());
    } else {
      req.setAttribute("response", "notFound");
    }
    req.getRequestDispatcher("/checkin-form.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
      IOException {
    FlightRequestWrapper request = new FlightRequestWrapper(req);
    String assento = request.stringParam("assento").toUpperCase();
    // Verifica se o assento já existe

    String codBilhete = request.stringParam("bilhete");
    PassagemModel passagemModel = new PassagemModel();
    Passagem pojo = passagemModel.consultarPorCodigoBilhete(codBilhete);
    List<Passagem> passagens = new PassagemModel().consultarPorVoo(pojo.getVoo());
    boolean assentoExist = false;

    for (Passagem passagem : passagens) {
      if (passagem.getAssento() != null) {
        if (passagem.getAssento().toUpperCase().equals(assento)) {
          assentoExist = true;
        }
      }
    }
    if (!assentoExist) {
      try {
        new PassagemModel().efetuarCheckin(pojo, assento);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
      } catch (SQLException e) {
        core.logError("Generic Error", e);
        req.setAttribute("exception", "Error on server " + e);
        req.getRequestDispatcher("/erro.jsp").forward(req, resp);
      }
    } else {
      req.setAttribute("exception", "Check-in has not successful");
      req.getRequestDispatcher("/erro.jsp").forward(req, resp);
    }

  }

}