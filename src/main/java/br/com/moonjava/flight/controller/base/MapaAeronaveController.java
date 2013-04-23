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
package br.com.moonjava.flight.controller.base;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.moonjava.flight.model.base.Aeronave;
import br.com.moonjava.flight.model.base.AeronaveModel;
import br.com.moonjava.flight.util.FlightRequestWrapper;

/**
 * @version 1.0 Apr 23, 2013
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/aeronave/map")
public class MapaAeronaveController extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    FlightRequestWrapper wrapper = new FlightRequestWrapper(req);
    Aeronave aeronave = new AeronaveModel().consultarPorId(wrapper.intParam("id"));

    req.setAttribute("aeronave", aeronave);
    req.getRequestDispatcher("/aeronave-map.jsp").forward(req, resp);
  }

}