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

import java.io.File;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import br.com.moonjava.flight.dao.base.AeronaveDAO;
import br.com.moonjava.flight.jdbc.Database;
import br.com.moonjava.flight.jdbc.FactoryJdbc;
import br.com.moonjava.flight.util.RequestParam;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class AeronaveModel implements Aeronave {

  private int id;
  private String codigo;
  private String nome;
  private int qtdDeAssento;
  private boolean mapa;
  private AeronaveDAO dao;
  private InputStream code;

  public AeronaveModel(Builder builder) {
    this.codigo = builder.getCodigo();
    this.nome = builder.getNome();
    this.qtdDeAssento = builder.getQtdDeAssento();
    this.mapa = builder.isMapa();
    this.code = builder.getCode();
  }

  public AeronaveModel() {
    Database database = FactoryJdbc.getInstance().getDatabase();
    if(database.equals(Database.MYSQL))
      dao = new AeronaveDAO();
    if(database.equals(Database.ORACLE))
      dao = null;
    if(database.equals(Database.SQL_SERVER))
      dao = null;
  }

  @Override
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  @Override
  public String getCodigo() {
    return codigo;
  }

  @Override
  public String getNome() {
    return nome;
  }

  @Override
  public int getQtdDeAssento() {
    return qtdDeAssento;
  }

  @Override
  public boolean isMapa() {
    return mapa;
  }

  @Override
  public InputStream getCode() throws SQLException {
    return code;
  }

  @Override
  public String toString() {
    return nome;
  }

  @Override
  public void criar(Aeronave pojo, File image) throws SQLException {
    dao.criar(pojo, image);
  }

  @Override
  public List<Aeronave> consultar(RequestParam request) {
    return dao.consultar(request);
  }

  @Override
  public Aeronave consultarPorId(int id) {
    return dao.consultarPorId(id);
  }

  @Override
  public void atualizar(Aeronave pojo) throws SQLException {
    dao.atualizar(pojo);
  }

  @Override
  public boolean deletar(int id) throws SQLException {
    return dao.deletar(id);
  }

}