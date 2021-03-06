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
import java.util.HashMap;
import java.util.Map;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class RequestParamWrapper implements RequestParam {

  private final Map<String, Object> map;

  // Este é o responsavel por Wrapper dos dados vindo de um Request (View0
  public RequestParamWrapper() {
    this.map = new HashMap<String, Object>();
  }

  public void set(String string, Object object) {
    map.put(string, object);
  }

  @Override
  public Integer intParam(String param) {
    return (Integer) map.get(param);
  }

  @Override
  public Long longParam(String param) {
    return (Long) map.get(param);
  }

  @Override
  public Double doubleParam(String param) {
    return (Double) map.get(param);
  }

  @Override
  public DateTime dateTimeParam(String param) {
    return (DateTime) map.get(param);
  }

  @Override
  public LocalDate localDateParam(String param) {
    return (LocalDate) map.get(param);
  }

  @SuppressWarnings("unchecked")
  @Override
  public <E extends Enum<E>> E enumParam(Class<E> enumClass, String param) {
    return (E) map.get(param);
  }

  @Override
  public String stringParam(String param) {
    return (String) map.get(param);
  }

  @Override
  public Boolean booleanParam(String param) {
    return (Boolean) map.get(param);
  }

  @Override
  public InputStream inputStreamParam(String param) {
    return (InputStream) map.get(param);
  }

  @Override
  public String getCountry() {
    return null;
  }

}