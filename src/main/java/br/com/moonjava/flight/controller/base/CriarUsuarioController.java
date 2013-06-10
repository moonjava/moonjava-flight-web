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

import org.joda.time.LocalDate;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.PessoaFisica;
import br.com.moonjava.flight.model.base.PessoaFisicaModel;
import br.com.moonjava.flight.model.base.Usuario;
import br.com.moonjava.flight.model.base.UsuarioModel;
import br.com.moonjava.flight.util.CPF;
import br.com.moonjava.flight.util.FlightRequestWrapper;
import br.com.moonjava.flight.util.FormatDateTime;
import br.com.moonjava.flight.util.GerarCodigo;
import br.com.moonjava.flight.util.VerifierString;

/**
 * @version 1.0 Aug 30, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/usuario/create")
public class CriarUsuarioController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();
  private String codigo;

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      FlightRequestWrapper request = new FlightRequestWrapper(req);
      CPF cpf = CPF.parse(request.stringParam("cpf"));

      UsuarioModel usuarioModel = new UsuarioModel();
      Usuario usuario = usuarioModel.consultarPorCpf(cpf);

      if (usuario != null) {
        req.setAttribute("criarUsuarioErro", "criar.usuario.erro");
      } else {
        PessoaFisicaModel pessoaFisicaModel = new PessoaFisicaModel();
        PessoaFisica pf = pessoaFisicaModel.consultarPorCPF(cpf);

        if (pf == null) {
          LocalDate date = null;
          if (VerifierString.isBirthDay(request.stringParam("nascimento"), req.getLocale().getCountry())) {
            date = FormatDateTime.parseToLocalDate(request.stringParam("nascimento"));
          } else {
            // TODO MENSAGEM
          }

          request.set("nascimento", date);

          request = new FlightRequestWrapper(req);
          PessoaFisica pojo = new PessoaFisicaCreate(request).createInstance();
          boolean executed = false;
          executed = pessoaFisicaModel.criar(pojo);

          if (executed) {
            PessoaFisica pessoa = pessoaFisicaModel.consultarPorCPF(pojo.getCpf());
            request.set("pessoaFisica", pessoa.getId());
          } else {
            return;
          }

          // Utiliza a PF existente (uma vez cliente)
        } else {
          req.setAttribute("pessoaFisica", pf.getId());
        }
        request = new FlightRequestWrapper(req);
        Usuario pojo = new UsuarioCreate(request).createInstance();
        new UsuarioModel().criar(pojo);
      }

      req.getRequestDispatcher("/consultar-usuario.jsp").forward(req, resp);
    } catch (Exception e) {
      core.logError("Error", e);
    }
  }
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    codigo = new GerarCodigo("USUARIO").getCodigo();
    req.setAttribute("codigo", codigo);
    req.getRequestDispatcher("/codigo.jsp").forward(req, resp);
  }

  public String getCodigo() {
    return codigo;
  }
}