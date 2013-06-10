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
package br.com.moonjava.flight.model.base;

import java.sql.SQLException;
import java.util.List;

import br.com.moonjava.flight.util.CPF;
import br.com.moonjava.flight.util.FlightRequestWrapper;
import br.com.moonjava.flight.util.RequestParam;

/**
 * @version 1.0, Aug 10, 2012
 * @contact miqueias@moonjava.com.br
 * 
 */
public interface Usuario {

  interface Builder extends br.com.moonjava.flight.util.Builder<Usuario> {

    String getCodigo();

    PessoaFisica getPessoaFisica();

    Perfil getPerfil();

    String getLogin();

    String getSenha();
  }

  interface Jdbc {

    void criar(Usuario usuario) throws SQLException;

    List<Usuario> consultar(RequestParam request);

    Usuario consultarPorCpf(CPF cpf);

    Usuario consultarUsuario(RequestParam request, String cript);

    boolean atualizar(Usuario usuario) throws SQLException;

    void deletar(int id) throws SQLException;

    Usuario consultarPorId(int id);

  }

  int getId();

  String getCodigo();

  PessoaFisica getPessoaFisica();

  Perfil getPerfil();

  String getLogin();

  String getSenha();

  void criar(Usuario pojo) throws SQLException;

  List<Usuario> consultar(FlightRequestWrapper request);

  Usuario consultarPorCpf(CPF cpf);

  Usuario consultarUsuario(FlightRequestWrapper request, String cript);

  Usuario consultarPorId(int id);

  void atualizar(Usuario pojo) throws SQLException;

  void deletar(int id) throws SQLException;

}