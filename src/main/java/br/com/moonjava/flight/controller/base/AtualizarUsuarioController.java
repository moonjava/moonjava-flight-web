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
import br.com.moonjava.flight.model.base.PessoaFisica;
import br.com.moonjava.flight.model.base.PessoaFisicaModel;
import br.com.moonjava.flight.model.base.Usuario;
import br.com.moonjava.flight.model.base.UsuarioModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;
import br.com.moonjava.flight.util.FormatDateTime;

/**
 * @version 1.0 Sep 3, 2012
 * @contact miqueias@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/usuario/update")
public class AtualizarUsuarioController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    FlightRequestWrapper request = new FlightRequestWrapper(req);
    Usuario usuario = new UsuarioUpdate(request).createInstance();
    PessoaFisica pf = new PessoaFisicaUpdate(request).createInstance();
    try {
      new UsuarioModel().atualizar(usuario);
      new PessoaFisicaModel().atualizar(pf);
      req.getRequestDispatcher("/consultar-usuario.jsp").forward(req, resp);
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

    Usuario usuario = new UsuarioModel().consultarPorId(id);
    PessoaFisica pf = usuario.getPessoaFisica();
    req.setAttribute("usuario_id", usuario.getId());
    req.setAttribute("usuario_codigo", usuario.getCodigo());
    req.setAttribute("pf_id", pf.getId());
    req.setAttribute("pf_nome", pf.getNome());
    req.setAttribute("pf_sobrenome", pf.getSobrenome());
    req.setAttribute("pf_nascimento", FormatDateTime.parseToStringLocalDate(pf.getDataNascimento().toString(), req.getLocale().getCountry()));
    req.setAttribute("pf_cpf", pf.getCpf().toString());
    req.setAttribute("pf_rg", pf.getRg());
    req.setAttribute("pf_endereco", pf.getEndereco());
    req.setAttribute("pf_telResidencial", pf.getTelResidencial());
    req.setAttribute("pf_telCelular", pf.getTelCelular());
    req.setAttribute("pf_email", pf.getEmail());
    req.setAttribute("usuario_perfil", usuario.getPerfil());
    req.setAttribute("usuario_login", usuario.getLogin());
    req.setAttribute("ussuario_senha", usuario.getSenha());
    req.getRequestDispatcher("/usuario-form-update.jsp").forward(req, resp);
  }
}