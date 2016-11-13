<body>

  {$php_errors}
  {include file={filePath file="setup_header.tpl"}}

{* FusionDirectory login - smarty template *}

<div id="window-container">

<div id="window-div">
<form action="index.php" method="post" id="loginform" name="loginform" onSubmit="js_check(this);return true;">

{$msg_dialogs}
  <div id="window-titlebar">
    <p>
      {t}Login screen{/t}
    </p>
  </div>
  <div id="window-content">

    <div class="optional">
      {t}Please use your username and your password to log into the site administration system.{/t}<br />
      {if $ssl}<span class="warning">{$ssl}</span>{/if}
      {if $lifetime}<span class="warning">{$lifetime}</span>{/if}
    </div>

    <div>
      <label for="username">
        <img class="center" src="{$personal_img|escape}" alt="{t}Username{/t}" title="{t}Username{/t}"/>&nbsp;
      </label>
      <input type="text" name="username" id="username" maxlength="40" value="{$username|escape}" title="{t}Username{/t}" />
      <br />
      <br />
      <label for="password">
        <img class="center" src="{$password_img|escape}" alt="{t}Password{/t}" title="{t}Password{/t}" />&nbsp;
      </label>
      <input type="password" name="password" id="password" maxlength="40" value="" title="{t}Password{/t}"/>
      <br />
      <a href="recovery.php">{t}I forgot my password{/t}</a>
    </div>
    <div>
      <img class="center" src="{$directory_img|escape}" alt="{t}Directory{/t}" title="{t}Directory{/t}" />&nbsp;
      <select name="server" title="{t}Directory{/t}" onchange="javascript:document.loginform.submit();">
        {html_options options=$server_options selected=$server_id}
      </select>
    </div>

      <!-- check, if cookies are enabled -->
      <p class="gosaLoginWarning">
       <script type="text/javascript">
        <!--
        document.cookie = "gosatest=empty;path=/";
        if (document.cookie.indexOf( "gosatest=") > -1 )
          document.cookie = "gosatest=empty;path=/;expires=Thu, 01-Jan-1970 00:00:01 GMT";
        else
          document.write("{$cookies}");
        -->
       </script>
      </p>
  </div>
  <div id="window-footer" class="plugbottom">
    <div>
      <!-- Display error message on demand -->
      {$message}
    </div>
    <div>
      <input type="submit" name="login" value="{t}Sign in{/t}" title="{t}Click here to log in{/t}"/>
      <input type="hidden" name="javascript" value="false" />
    </div>
  </div>

</form>
</div>

{$errors}

</div>

<script type="text/javascript">
<!--
  enable_keyPress = false;
  focus_field("{$focusfield}");
  next_msg_dialog();
-->
</script>
</body>
</html>
