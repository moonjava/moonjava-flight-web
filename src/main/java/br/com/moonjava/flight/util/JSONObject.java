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

import java.util.Collection;
import java.util.Map;

import org.json.JSONException;

import br.com.moonjava.flight.core.FlightCore;

/**
 * @version 1.0 Apr 20, 2013
 * @contact tiago.aguiar@moonjava.com.br
 * 
 */
public class JSONObject extends org.json.JSONObject {

  private final FlightCore core = FlightCore.getInstance();

  @Override
  public org.json.JSONObject put(String arg0, boolean arg1) {
    try {
      return super.put(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject put(String arg0, Collection arg1) {
    try {
      return super.put(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject put(String arg0, double arg1) {
    try {
      return super.put(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject put(String arg0, int arg1) {
    try {
      return super.put(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject put(String arg0, long arg1) {
    try {
      return super.put(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject put(String arg0, Map arg1) {
    try {
      return super.put(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject put(String arg0, Object arg1) {
    try {
      return super.put(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject putOnce(String arg0, Object arg1) {
    try {
      return super.putOnce(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

  @Override
  public org.json.JSONObject putOpt(String arg0, Object arg1) {
    try {
      return super.putOpt(arg0, arg1);
    } catch (JSONException e) {
      core.logError("JSON Error", e);
    }
    return null;
  }

}