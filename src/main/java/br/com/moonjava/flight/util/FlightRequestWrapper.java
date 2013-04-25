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

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletRequest;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class FlightRequestWrapper implements RequestParam {

  private final ServletRequest req;

  public FlightRequestWrapper(ServletRequest req) {
    this.req = req;
  }

  @Override
  public Double doubleParam(String param) {
    try {
      String value = req.getParameter(param);
      return Double.valueOf(value);
    } catch (NullPointerException e) {
      return null;
    } catch (NumberFormatException e) {
      return null;
    }
  }

  @Override
  public Long longParam(String param) {
    try {
      String value = req.getParameter(param);
      return Long.valueOf(value);
    } catch (NullPointerException e) {
      return null;
    } catch (NumberFormatException e) {
      return null;
    }
  }
  @Override
  public String stringParam(String param) {
    return req.getParameter(param);
  }

  @Override
  public <E extends Enum<E>> E enumParam(Class<E> enumClass, String param) {
    E res = null;

    String value = req.getParameter(param);
    if (value != null) {
      try {
        res = Enum.valueOf(enumClass, value);
      } catch (IllegalArgumentException e) {

      }
    }

    return res;
  }

  @Override
  public Integer intParam(String param) {
    try {
      String value = req.getParameter(param);
      return Integer.valueOf(value);
    } catch (NullPointerException e) {
      return null;
    } catch (NumberFormatException e) {
      return null;
    }
  }

  @Override
  public DateTime dateTimeParam(String param) {
    try {
      String value = validDate(req.getParameter(param));
      return value.isEmpty() ? null : FormatDateTime.parseToDateTime(value, req.getLocale().getCountry());

    } catch (NullPointerException e) {
      return null;
    }
  }

  @Override
  public LocalDate localDateParam(String param) {
    try {
      String value = validDate(req.getParameter(param));
      return value.isEmpty() ? null : FormatDateTime.parseToLocalDate(value, req.getLocale().getCountry());
    } catch (NullPointerException e) {
      return null;
    }
  }

  public String validDate(String value) {
    if (value.endsWith("_")) {
      return "";
    }
    return value;
  }

  @Override
  public Boolean booleanParam(String param) {
    String value = req.getParameter(param);
    return Boolean.valueOf(value);
  }

  @Override
  public InputStream inputStreamParam(String param) {
    try {
      return req.getInputStream();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  @Override
  public String getCountry() {
    return req.getLocale().getCountry();
  }

}