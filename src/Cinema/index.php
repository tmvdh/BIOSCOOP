<?php
/**
 * Created by PhpStorm.
 * User: Tom
 * Date: 02/04/2015
 * Time: 15:22
 */

session_start();
include ("doctrine.loader.php");

use Cinema\Data\FilmDAO;
use Cinema\Entities\Fi$lm;


$FilmDAO = new FilmDAO();
$list = $FilmDAO->getFilmsByDate(2015-04-04);