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
import br.com.moonjava.flight.model.base.Passagem;
import br.com.moonjava.flight.model.base.PassagemModel;
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
        } else if (reembolso == 0.0) {
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

  // private class EfetuarCancelamentoHandler implements ActionListener {
  //
  // @Override
  // public void actionPerformed(ActionEvent e) {
  // RequestParamWrapper request = getParametersReebolso();
  // // Caso o usuario adicione virgula, o sistema atribuirá ponto
  // // para cadastrar o dado no banco de dados
  // ReembolsoModel model = new ReembolsoModel();
  // PassagemModel modelPassagem = new PassagemModel();
  // String valor = request.stringParam("valor").replace(",", ".");
  // boolean status = false;
  //
  // if (!valor.equals("0.0")) {
  // CPF _cpf = null;
  // try {
  // _cpf = CPF.parse(request.stringParam("cpf"));
  // request.set("passagem", passagem.getId());
  // request.set("banco", Integer.parseInt(request.stringParam("banco")));
  // request.set("agencia", Integer.parseInt(request.stringParam("agencia")));
  // request.set("conta", Integer.parseInt(request.stringParam("conta")));
  // request.set("valor", Double.parseDouble(valor));
  // request.set("cpf", _cpf.getDigito());
  // Reembolso reembolso = new ReembolsoCreate(request).createInstance();
  //
  // status = model.criar(reembolso);
  // } catch (Exception e2) {
  // return;
  // }
  // }
  //
  // status = modelPassagem.efetuarCancelamento(passagem);
  //
  // if (status) {
  // new VooModel().incrementarAssento(passagem.getVoo().getId());
  // messageReembolso();
  // messageOK();
  // } else {
  // messageDbOff();
  // }
  // }
  // }

}