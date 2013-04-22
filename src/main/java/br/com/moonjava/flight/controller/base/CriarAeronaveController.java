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

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import br.com.moonjava.flight.core.FlightCore;
import br.com.moonjava.flight.model.base.Aeronave;
import br.com.moonjava.flight.model.base.AeronaveModel;
import br.com.moonjava.flight.util.GerarCodigo;
import br.com.moonjava.flight.util.JSONObject;
import br.com.moonjava.flight.util.RequestParamWrapper;

/**
 * @version 1.0 Aug 29, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@WebServlet(value = "/base/aeronave/create")
public class CriarAeronaveController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private final FlightCore core = FlightCore.getInstance();
  private String codigo;

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    RequestParamWrapper request = new RequestParamWrapper();
    PrintWriter out = resp.getWriter();
    File uploadedFile = null;
    InputStream inputStream = null;

    // Busca parametros do request
    boolean isMultipart = ServletFileUpload.isMultipartContent(req);

    if (isMultipart) {
      FileItemFactory factory = new DiskFileItemFactory();

      // Cria um handler de upload
      ServletFileUpload upload = new ServletFileUpload(factory);

      try {
        // Parse de request
        List<FileItem> items = upload.parseRequest(req);
        Iterator<FileItem> iterator = items.iterator();
        while (iterator.hasNext()) {
          FileItem item = iterator.next();
          if (!item.isFormField()) {
            String fileName = item.getName();
            uploadedFile = new File(fileName);
            // Validando extensão de arquivos
            boolean accept = accept(uploadedFile.getName());

            if (accept) {
              inputStream = new FileInputStream(uploadedFile);
              Aeronave aeronave = new AeronaveCreate(request, inputStream).createInstance();
              try {
                new AeronaveModel().criar(aeronave, uploadedFile);
                req.getRequestDispatcher("/consulta-aeronave.jsp").forward(req, resp);
              } catch (SQLException e) {
                core.logError("SQL Error", e);
              }
            } else {
              out.print("error");
            }

            core.logInfo("Create file [" + fileName + "] in memory");
            item.write(uploadedFile);
          } else {
            if (item.getFieldName().equals("qtdDeAssento"))
              request.set(item.getFieldName(), Integer.parseInt(item.getString()));
            else
              request.set(item.getFieldName(), item.getString());
          }
        }

        out.print(new JSONObject());
      } catch (FileUploadException e) {
        core.logError("File Upload error", e);
        out.print("error");
      } catch (Exception e) {
        core.logError("Generic Error", e);
        out.print("error");
      }
    }
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    codigo = new GerarCodigo("AERONAVE").getCodigo();
    req.setAttribute("codigo", codigo);
    req.getRequestDispatcher("/aeronave-codigo.jsp").forward(req, resp);
  }

  public boolean accept(String name) {
    return name.toLowerCase().endsWith(".jpg") ||
        name.toLowerCase().endsWith(".png") ||
        name.toLowerCase().endsWith(".jpeg");
  }

  public String getCodigo() {
    return codigo;
  }

}