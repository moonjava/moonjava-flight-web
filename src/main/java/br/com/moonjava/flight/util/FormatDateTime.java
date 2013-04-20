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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class FormatDateTime {

  public static DateTime parseDateTime(String value) {
    try {
      Date date = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(value);
      String format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(date);
      return DateTime.parse(format);
    } catch (ParseException e) {
      throw new RuntimeException(e);
    }
  }

  public static LocalDate parseLocalDate(String value) {
    try {
      Date date = new SimpleDateFormat("dd/MM/yyyy").parse(value);
      String format = new SimpleDateFormat("yyyy-MM-dd").format(date);
      return LocalDate.parse(format);
    } catch (ParseException e) {
      throw new RuntimeException(e);
    }
  }

}