<?php
include_once("includes/header.php");
include_once("includes/db_functions.php");
force_login();
header("Location: main.php"); /* Redirect browser */
exit;
?>
