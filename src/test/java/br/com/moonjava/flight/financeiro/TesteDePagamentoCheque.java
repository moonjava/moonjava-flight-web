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
package br.com.moonjava.flight.financeiro;

import static org.hamcrest.MatcherAssert.assertThat;

import static org.hamcrest.Matchers.equalTo;

import org.testng.annotations.Test;

import br.com.moonjava.flight.controller.financeiro.ChequeCreate;
import br.com.moonjava.flight.model.financeiro.Cheque;
import br.com.moonjava.flight.util.RequestParamWrapper;

/**
 * @version 1.0 Apr 10, 2012
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
@Test
public class TesteDePagamentoCheque {

  public void cheque_deve_ser_criado() {
    RequestParamWrapper request = new RequestParamWrapper();

    String titular = "titularA";
    int numero = 123;
    int banco = 741;
    int agencia = 1234;
    int conta = 990909;
    double valor = 550.30;

    request.set("titular", titular);
    request.set("numero", numero);
    request.set("banco", banco);
    request.set("agencia", agencia);
    request.set("conta", conta);
    request.set("valor", valor);

    Cheque res = new ChequeCreate(request).createInstance();
    assertThat(res.getTitular(), equalTo(titular));
    assertThat(res.getNumero(), equalTo(numero));
    assertThat(res.getBanco(), equalTo(banco));
    assertThat(res.getAgencia(), equalTo(agencia));
    assertThat(res.getConta(), equalTo(conta));
    assertThat(res.getValor(), equalTo(valor));
  }

}