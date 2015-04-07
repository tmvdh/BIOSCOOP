<?php
session_start();
include ("doctrine.loader.php");

use Cinema\Business\TicketService;

        if (isset($_SESSION["barcode"])){
            $view = $twig->render("thankyou.twig", array("barcode" => $_SESSION["barcode"]));
            print($view);
        }
        elseif ($_SESSION["fname"] && $_SESSION["sname"] && $_SESSION["email"] && $_SESSION["show"] && $_SESSION["seat"]) {

            #check seat is available!
            $TicketSvc = new TicketService();
            $seatcheck = $TicketSvc->checkSeat($_SESSION["show"], $_SESSION["seat"]);
            if($seatcheck){
              echo '<h4>Sorry, iemand was je te snel af!</h4>';
              echo '<br><a href="index.php">Probeer opnieuw</a>';
            }
            else {
                $user = $TicketSvc->addUser($_SESSION["fname"], $_SESSION["sname"], $_SESSION["email"]);
                $barcode = $TicketSvc->addTicket($user, $_SESSION["show"], $_SESSION["seat"]);

                $view = $twig->render("thankyou.twig", array("barcode" => $barcode));
                print($view);
                session_unset();
                $_SESSION["barcode"] = $barcode;
            }
        }

    else {
        echo 'Something went wrong... <br>';
        echo '<a href="index.php">Return to beginning</a>';
        }
