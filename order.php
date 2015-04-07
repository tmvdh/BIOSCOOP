<?php
session_start();
include ("doctrine.loader.php");

use Cinema\Business\TicketService;

if($_SESSION["fname"] && $_SESSION["sname"] && $_SESSION["email"] && $_SESSION["show"] && $_SESSION["seat"]){

    $TicketService = new TicketService();
    $user = $TicketService->addUser($_SESSION["fname"], $_SESSION["sname"], $_SESSION["email"]);
    $barcode = $TicketService->addTicket($user, $_SESSION["show"], $_SESSION["seat"]);

    $view = $twig->render("thankyou.twig", array("barcode" => $barcode));
    print($view);
}
else {
        echo 'Something went wrong... <br>';
        echo '<a href="index.php">Return to beginning</a>';

}