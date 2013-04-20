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

import java.util.ResourceBundle;

import javax.swing.JOptionPane;

/**
 * @version 1.0 Sep 7, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class ErrorSystem {

  public static void addException(Exception e, ResourceBundle bundle) {
    JOptionPane.showMessageDialog(null,
        bundle.getString("erro.sistema.administrador") + "\n\n[ERROR] " + e.getMessage(),
        bundle.getString("erro.sistema.titulo"),
        JOptionPane.ERROR_MESSAGE);
  }

}