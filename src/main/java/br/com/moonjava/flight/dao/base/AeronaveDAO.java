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
package br.com.moonjava.flight.dao.base;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import br.com.moonjava.flight.controller.base.AeronaveLoader;
import br.com.moonjava.flight.jdbc.SqlStatement;
import br.com.moonjava.flight.jdbc.SqlStatementWrapper;
import br.com.moonjava.flight.model.base.Aeronave;
import br.com.moonjava.flight.util.RequestParam;

/**
 * @version 1.0, 25/07/2012
 * @contact miqueias@moonjava.com.br
 * 
 */
public class AeronaveDAO implements Aeronave.Jdbc {

  private SqlStatement query() {
    return new SqlStatementWrapper()
        .prepare()

        .with("select *")
        .with("from FLIGHT.AERONAVE as AERONAVE")

        .load(new AeronaveLoader());
  }

  @Override
  public void criar(Aeronave aeronave, File image) throws SQLException {
    new SqlStatementWrapper()
        .prepare()

        .with("insert into FLIGHT.AERONAVE")
        .with("(NOME, CODIGO, QTD_ASSENTO, IMAGEM, MAPA)")
        .with("values (")
        .with("?,", aeronave.getNome())
        .with("?,", aeronave.getCodigo())
        .with("?,", aeronave.getQtdDeAssento())
        .with("?,", aeronave.getCode(), image)
        .with("?)", aeronave.isMapa())

        .andExecute();
  }

  @Override
  public List<Aeronave> consultar(RequestParam request) {
    String nome = request.stringParam("nome");
    String codigo = request.stringParam("codigo");

    return query()

        .with("where 1 = 1")
        .with("and AERONAVE.NOME like concat ('%',?,'%')", nome)
        .with("and AERONAVE.CODIGO like concat ('%',?,'%')", codigo)
        .with("order by AERONAVE.CODIGO asc")

        .andList();
  }

  @Override
  public Aeronave consultarPorId(int id) {
    return query()

        .with("where ID = ?", id)

        .andGet();
  }

  @Override
  public void atualizar(Aeronave aeronave) throws SQLException {
    String nome = aeronave.getNome().isEmpty() ? null : aeronave.getNome();
    new SqlStatementWrapper()
        .prepare()

        .with("update FLIGHT.AERONAVE AS AERONAVE set")
        .with("AERONAVE.NOME = ?", nome)
        .with("where AERONAVE.ID = ?", aeronave.getId())

        .andExecute();
  }

  @Override
  public boolean deletar(int id) throws SQLException {
    return new SqlStatementWrapper()
        .prepare()

        .with("delete from FLIGHT.AERONAVE")
        .with("where ID = ?", id)

        .andExecute();
  }

}