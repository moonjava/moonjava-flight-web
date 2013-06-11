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
package br.com.moonjava.flight.jdbc;

import br.com.moonjava.flight.core.FlightCore;

/**
 * @version 1.0 Jun 10, 2013
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class FactoryJdbc {

  private static FactoryJdbc factoryJdbc = new FactoryJdbc();
  private FlightCore core = FlightCore.getInstance();

  public static FactoryJdbc getInstance() {
    return factoryJdbc != null ? factoryJdbc : new FactoryJdbc(); // Singleton
  }

  public Database getDatabase() {
    if (core.getJdbc().equals(Database.MYSQL)) {
      return Database.MYSQL;
    } else if (core.getJdbc().equals(Database.ORACLE)) {
      return Database.ORACLE;
    }  else {
      return Database.SQL_SERVER;
    }
  }

}