/*
 * Copyright 2013 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.google.plus.samples.photohunt.model;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

/**
 * Service wrapper for Objectify, allowing us to register our models.
 *
 * @author vicfryzel@google.com (Vic Fryzel)
 */
public class OfyService {
  // Register our models with Objectify.  If you add a new model, make sure to
  // register it here as well.
  static {
    factory().register(DirectedUserToUserEdge.class);
    //factory().register(Photo.class);
    //factory().register(Theme.class);
    factory().register(User.class);
   // factory().register(Vote.class);
  }

  /**
   * @return Objectify instance to use for datastore interaction.
   */
  public static Objectify ofy() {
    return ObjectifyService.ofy();
  }

  /**
   * @return Factory for Objectify instances.
   */
  public static ObjectifyFactory factory() {
    return ObjectifyService.factory();
  }
}
