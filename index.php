<?php
session_start();
include ("doctrine.loader.php");

use Cinema\Business\FilmService;
use Cinema\Business\TicketService;
/* Old code
# listen for page reloads
# no date -> pick date
if(!isset($_POST["date"]) || empty($_POST["date"])) {
    $view = $twig->render("pickDate.twig");
    print($view);
# date but no film -> pick film
} elseif (!isset($_POST["film"]) || empty($_POST["film"])){
    $_SESSION["date"] = $_POST["date"];
    $FilmService = new FilmService();
    $FilmList = $FilmService->getFilmsByDate($_POST["date"]);
    $view = $twig->render("pickFilm.twig", array("filmlist" => $FilmList));
    print($view);
   # date and film -> pick show
}else {
    $_SESSION["film"] = $_POST["film"];
    $FilmService = new FilmService();
    $shows = $FilmService->getShows($_SESSION["film"], $_SESSION["date"]);
    $view = $twig->render("pickShow.twig", array("shows" => $shows));
    print($view);

}
*/

# if date -> select film
if(isset($_POST["date"]) && !empty($_POST["date"])){
    $_SESSION["date"] = $_POST["date"];
    $FilmService = new FilmService();
    $FilmList = $FilmService->getFilmsByDate($_POST["date"]);
    $view = $twig->render("pickFilm.twig", array("filmlist" => $FilmList));
    print($view);
}
# if film -> select show
elseif(isset($_POST["film"]) && !empty($_POST["film"])){
    $_SESSION["film"] = $_POST["film"];
    $FilmService = new FilmService();
    $shows = $FilmService->getShows($_SESSION["film"], $_SESSION["date"]);
    $view = $twig->render("pickShow.twig", array("shows" => $shows, "session" => $_SESSION));
    print($view);
}
# if show -> select seat
elseif(isset($_POST["show"]) && !empty($_POST["show"])){
    $_SESSION["show"] = $_POST["show"];
    $TicketService = new TicketService();
    $seats = $TicketService->getAllTickets($_POST["show"]);
    $view = $twig->render("pickSeat.twig", array("seats" => $seats));
    print($view);
}
#if seat -> confirm
elseif(isset($_POST["seat"]) && !empty($_POST["seat"])){

}
# else -> select date
else {
    $view = $twig->render("pickDate.twig");
    print($view);
}




#anything else?




