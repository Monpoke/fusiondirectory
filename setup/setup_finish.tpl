<div class='default'>
  <p>
    <b>{t}Create your configuration file{/t}</b>
  </p>
  <p> 
    {$msg2}
  </p>
      {t}Run {/t}
       <a style='color:black ; font-weight:bold '>   fusiondirectory-setup --check-config</a>
      {t}to put the correct right on fusiondirectory.conf{/t}
  <p> 
    <input type='submit' name='getconf' value='{t}Download configuration{/t}'>
  </p>
    {if $err_msg != ""}
      <hr/>
      <br/>
      {t}Status: {/t}
      <a style='color:red ; font-weight:bold '>{$err_msg}</a>
    {/if}

</div>
<input type='hidden' value='1' name='step8_posted'>
