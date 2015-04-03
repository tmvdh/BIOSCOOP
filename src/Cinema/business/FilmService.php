<?php
namespace Cinema\Business;

use Cinema\Data\FilmDAO;


Class FilmService{

    public function getFilmsByDate($date){
        $FilmDAO = new FilmDAO();
        $films = $FilmDAO->getFilmsByDate($date);
        return $films;
    }

    public function getShows($Film_ID, $date){
        $FilmDAO = new FilmDAO();
        $shows = $FilmDAO->getShows($Film_ID, $date);
        return $shows;
    }



}