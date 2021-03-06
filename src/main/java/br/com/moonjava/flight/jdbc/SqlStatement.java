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

import java.io.File;
import java.sql.SQLException;
import java.util.List;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public interface SqlStatement {

  SqlStatement prepare();

  SqlStatement with(String syntax);

  SqlStatement with(String syntax, Object object);

  SqlStatement load(ResultSetJdbcLoader<?> loader);

  <T> List<T> andList();

  <T> T andGet();

  boolean andExecute() throws SQLException;

  SqlStatement with(String syntax, Object object, File image);

}