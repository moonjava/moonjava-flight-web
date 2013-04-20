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
package br.com.moonjava.flight.core;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeSuite;

/**
 * @version 1.0 Feb 20, 2013
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class FlightLoaderTest {

  private ServletContextEvent event;

  @Mock
  protected HttpServletRequest request;
  @Mock
  protected HttpServletResponse response;
  @Mock
  protected HttpSession session;

  @BeforeSuite
  public void start() {
    ServletContext context = Mockito.mock(ServletContext.class);
    event = new ServletContextEvent(context);
    new FlightCore().contextInitialized(event);
  }

  @BeforeMethod
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @AfterSuite
  public void stop() {
    FlightCore.getInstance().contextDestroyed(event);
  }

}