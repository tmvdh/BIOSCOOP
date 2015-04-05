<?php
session_start();
include ("doctrine.loader.php");

use Cinema\Business\FilmService;
use Cinema\Business\TicketService;

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
    print_r($FilmList);
# date and film -> pick show
}else {
    $_SESSION["film"] = $_POST["film"];
    $FilmService = new FilmService();
    $shows = $FilmService->getShows($_SESSION["film"], $_SESSION["date"]);
    $view = $twig->render("pickShow.twig", array("shows" => $shows));
    print($view);
}

#anything else?




