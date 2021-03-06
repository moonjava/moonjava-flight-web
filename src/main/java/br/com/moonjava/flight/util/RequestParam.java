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
package br.com.moonjava.flight.util;

import java.io.InputStream;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public interface RequestParam {

  Integer intParam(String param);

  Long longParam(String param);

  Double doubleParam(String param);

  DateTime dateTimeParam(String param);

  LocalDate localDateParam(String param);

  <E extends Enum<E>> E enumParam(Class<E> enumClass, String param);

  String stringParam(String param);

  Boolean booleanParam(String param);

  InputStream inputStreamParam(String param);

  String getCountry();

}