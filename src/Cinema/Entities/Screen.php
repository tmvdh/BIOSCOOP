<?php
/**
 * Created by PhpStorm.
 * User: tom.vanderheijden
 * Date: 1/04/2015
 * Time: 13:56
 */

namespace Cinema\Entities;


class Screen {
    private $id;
    private $seats;

    public function __construct($id, $seats){
        $this->id = $id;
        $this->seats = $seats;
    }

    #getters
    public function getID(){
        return $this->id;
    }
    public function getSeats(){
        return $this->seats;
    }
    #setters
    public function setID($id){
        $this->id = $id;
    }
    public function setSeats($seats){
        $this->seats = $seats;
    }

}