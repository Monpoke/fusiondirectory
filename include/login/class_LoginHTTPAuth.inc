<?php
/*
  This code is part of FusionDirectory (http://www.fusiondirectory.org/)
  Copyright (C) 2017-2018  FusionDirectory

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
*/

/*!
 * \brief Login via HTTP Basic Auth
 */
class LoginHTTPAuth extends LoginMethod
{
  /*! \brief All login steps in the right order for HTTP auth login */
  static function loginProcess()
  {
    global $config, $message;

    static::init();

    if (!isset($_SERVER['PHP_AUTH_USER'])) {
      static::authenticateHeader();
    }

    static::$username = $_SERVER['PHP_AUTH_USER'];
    static::$password = $_SERVER['PHP_AUTH_PW'];

    $success = static::runSteps(array(
      'validateUserInput',
      'ldapLoginUser',
      'checkForLockingBranch',
      'loginAndCheckExpired',
      'runSchemaCheck',
    ));

    if ($success) {
      /* Everything went well, redirect to main.php */
      static::redirect();
    } else {
      static::authenticateHeader($message);
    }
  }

  static function active()
  {
    global $config;
    return ($config->get_cfg_value('httpAuthActivated') == 'TRUE');
  }
}