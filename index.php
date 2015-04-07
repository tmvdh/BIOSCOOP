<?php
session_start();
include ("doctrine.loader.php");

use Cinema\Business\FilmService;
use Cinema\Business\TicketService;


if(isset($_POST)){
    echo '$_POST = ';
    var_dump($_POST);
    echo '<br>';
}
if(isset($_SESSION)){
    echo '$_SESSION = ';
    var_dump($_SESSION);
}

# if date -> select film
if(isset($_POST["date"]) && !empty($_POST["date"])){
    session_unset();
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
    $seats = $TicketService->getAllTickets($_SESSION["show"]);
    $view = $twig->render("pickSeat.twig", array("seats" => $seats));
    print($view);
}
#if seat -> confirm
elseif(isset($_POST["seat"]) && !empty($_POST["seat"])) {


        if ($_POST["seat"] && $_POST["fname"]&& $_POST["sname"] && $_POST["email"]){
            $_SESSION["seat"] = $_POST["seat"];
            $_SESSION["fname"] = $_POST["fname"];
            $_SESSION["sname"] = $_POST["sname"];
            $_SESSION["email"] = $_POST["email"];
            $FilmService = new FilmService();
            $title = $FilmService->getTitle($_SESSION["film"]);
            $_SESSION["title"] = $title;
            $time = $FilmService->getShowtime($_SESSION["show"]);
            $_SESSION["time"] = $time;

            $view = $twig->render("confirm.twig", array("session" => $_SESSION));
            print($view);
        }
/*        else {
            echo 'Alle velden invullen, a.u.b.';
            $TicketService = new TicketService();
            $seats = $TicketService->getAllTickets($_SESSION["show"]);
            $view = $twig->render("pickSeat.twig", array("seats" => $seats));
            print($view);
        }
*/
}
# else -> select date
else {
    $view = $twig->render("pickDate.twig");
    print($view);
}




#anything else?




