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

import br.com.moonjava.flight.dao.base.UsuarioDAO;
import br.com.moonjava.flight.jdbc.Database;
import br.com.moonjava.flight.jdbc.FactoryJdbc;
import br.com.moonjava.flight.util.CPF;
import br.com.moonjava.flight.util.FlightRequestWrapper;

/**
 * @version 1.0, Aug 10, 2012
 * @contact miqueias@moonjava.com.br
 * 
 */
public class UsuarioModel implements Usuario {

  private int id;
  private String codigo;
  private PessoaFisica pessoaFisica;
  private Perfil perfil;
  private String login;
  private String senha;
  private UsuarioDAO dao;

  public UsuarioModel(Builder builder) {
    this.codigo = builder.getCodigo();
    this.pessoaFisica = builder.getPessoaFisica();
    this.perfil = builder.getPerfil();
    this.login = builder.getLogin();
    this.senha = builder.getSenha();
  }

  public UsuarioModel() {
    Database database = FactoryJdbc.getInstance().getDatabase();
    if(database.equals(Database.MYSQL))
      dao = new UsuarioDAO();
    if(database.equals(Database.ORACLE))
      dao = null;
    if(database.equals(Database.SQL_SERVER))
      dao = null;
  }

  public void setId(int id) {
    this.id = id;
  }

  @Override
  public int getId() {
    return id;
  }

  @Override
  public String getCodigo() {
    return codigo;
  }

  @Override
  public PessoaFisica getPessoaFisica() {
    return pessoaFisica;
  }

  @Override
  public Perfil getPerfil() {
    return perfil;
  }

  @Override
  public String getLogin() {
    return login;
  }

  @Override
  public String getSenha() {
    return senha;
  }

  @Override
  public List<Usuario> consultar(FlightRequestWrapper request) {
    return dao.consultar(request);
  }

  @Override
  public void deletar(int id) throws SQLException {
    dao.deletar(id);
  }

  @Override
  public void atualizar(Usuario pojo) throws SQLException {
    dao.atualizar(pojo);
  }

  @Override
  public Usuario consultarUsuario(FlightRequestWrapper request, String cript) {
    return dao.consultarUsuario(request, cript);
  }

  @Override
  public void criar(Usuario pojo) throws SQLException {
    dao.criar(pojo);
  }

  @Override
  public Usuario consultarPorCpf(CPF cpf) {
    return dao.consultarPorCpf(cpf);
  }

  @Override
  public Usuario consultarPorId(int id) {
    return dao.consultarPorId(id);
  }

}