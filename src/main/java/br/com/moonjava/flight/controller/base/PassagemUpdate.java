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

import br.com.moonjava.flight.model.base.Passagem;
import br.com.moonjava.flight.model.base.PassagemModel;
import br.com.moonjava.flight.model.base.PessoaFisica;
import br.com.moonjava.flight.model.base.Voo;

/**
 * @version 1.0 07/10/2012
 * @contact miqueias@moonjava.com.br
 * 
 */
public class PassagemUpdate implements Passagem.Builder {

  private final Passagem passagem;
  private final Voo voo;

  public PassagemUpdate(Passagem passagem, Voo voo) {
    this.passagem = passagem;
    this.voo = voo;
  }

  @Override
  public Passagem createInstance() {
    PassagemModel impl = new PassagemModel(this);
    impl.setId(passagem.getId());
    return impl;
  }

  @Override
  public Voo getVoo() {
    return voo;
  }

  @Override
  public PessoaFisica getPessoaFisica() {
    return null;
  }

  @Override
  public String getCodigoBilhete() {
    return null;
  }

  @Override
  public String getAssento() {
    return null;
  }

}