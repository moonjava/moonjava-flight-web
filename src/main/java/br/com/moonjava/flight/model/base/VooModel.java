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

import org.joda.time.DateTime;

import br.com.moonjava.flight.dao.base.VooDAO;
import br.com.moonjava.flight.jdbc.Database;
import br.com.moonjava.flight.jdbc.FactoryJdbc;
import br.com.moonjava.flight.util.RequestParam;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class VooModel implements Voo {

  private int id;
  private String codigo;
  private Aeronave aeronave;
  private String origem;
  private String destino;
  private String escala;
  private DateTime dataDePartida;
  private DateTime dataDeChegada;
  private String observacao;
  private Status status;
  private int assentoLivre;
  private double preco;
  private VooDAO dao;

  public VooModel(Builder builder) {
    this.codigo = builder.getCodigo();
    this.aeronave = builder.getAeronave();
    this.origem = builder.getOrigem();
    this.destino = builder.getDestino();
    this.escala = builder.getEscala();
    this.dataDePartida = builder.getDataDePartida();
    this.dataDeChegada = builder.getDataDeChegada();
    this.observacao = builder.getObservacao();
    this.status = builder.getStatus();
    this.assentoLivre = builder.getAssentoLivre();
    this.preco = builder.getPreco();
  }

  public VooModel() {
    Database database = FactoryJdbc.getInstance().getDatabase();
    if(database.equals(Database.MYSQL))
      dao = new VooDAO();
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
  public Aeronave getAeronave() {
    return aeronave;
  }

  @Override
  public String getOrigem() {
    return origem;
  }

  @Override
  public String getDestino() {
    return destino;
  }

  @Override
  public String getEscala() {
    return escala;
  }

  @Override
  public DateTime getDataDePartida() {
    return dataDePartida;
  }

  @Override
  public DateTime getDataDeChegada() {
    return dataDeChegada;
  }

  @Override
  public String getObservacao() {
    return observacao;
  }

  @Override
  public Status getStatus() {
    return status;
  }

  @Override
  public int getAssentoLivre() {
    return assentoLivre;
  }

  @Override
  public double getPreco() {
    return preco;
  }

  @Override
  public List<Voo> consultaPainel() {
    return dao.consultaPainel();
  }

  @Override
  public boolean criar(Voo pojo) throws SQLException {
    return dao.criar(pojo);
  }

  @Override
  public List<Voo> consultar(RequestParam request) {
    return dao.consultar(request);
  }

  @Override
  public void deletar(int id) throws SQLException {
    dao.deletar(id);
  }

  @Override
  public boolean atualizar(Voo pojo) throws SQLException {
    return dao.atualizar(pojo);
  }

  @Override
  public void controlarStatus(int id, Status fromString) throws SQLException {
    dao.controlarStatus(id, fromString);
  }

  @Override
  public void incrementarAssento(int vooId) throws SQLException {
    dao.incrementarAssento(vooId);
  }

  @Override
  public void decrementarAssento(int vooId) throws SQLException {
    dao.decrementarAssento(vooId);
  }

  @Override
  public void deletaPorAeronaveId(int aeronaveId) throws SQLException {
    dao.deletarPorAeronaveId(aeronaveId);
  }

  @Override
  public List<Voo> consultarPorAeronaveId(int id) {
    return dao.consultarPorAeronaveId(id);
  }

  @Override
  public Voo consultarPorId(int id) {
    return dao.consultarPorId(id);
  }

}