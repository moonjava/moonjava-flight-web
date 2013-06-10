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

import java.io.File;
import java.util.ResourceBundle;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0 Apr 18, 2013
 * @contact tiago.aguiar@moonjava.com.br
 * 
 *          Este é Core do projeto, sendo iniciado pelo Container Web, os pré-requisitos da
 *          aplicação como Logs devem ser iniciados através do Core
 * 
 */
public class FlightCore implements ServletContextListener {

  private static FlightCore core = new FlightCore();
  private ResourceBundle bundle;
  private Logger log;

  public static FlightCore getInstance() {
    return core != null ? core : new FlightCore(); // Singleton
  }

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    core = this;
    initLog();
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {
  }

  private void initLog() {
    log = LoggerFactory.getLogger(FlightCore.class);
    File folder = new File(System.getProperty("user.home") + File.separator + "Log");
    // Cria uma pasta no computador caso nao exista para salvar os LOGs diários
    // do sistema
    if (!folder.exists()) {
      folder.mkdir();
      folder.setWritable(true, true);
      log.info("Log Folder created");
    }

    log.info("Starting Log Flight Web");
  }

  public void logError(String msg, Exception e) {
    log.error(msg, e);
  }

  public void logInfo(String msg) {
    log.info(msg);
  }

}