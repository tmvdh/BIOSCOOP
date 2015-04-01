<?php
/**
 * Created by PhpStorm.
 * User: tom.vanderheijden
 * Date: 1/04/2015
 * Time: 13:47
 */

namespace Cinema\Entities;


class User {

    private $id;
    private $fname;
    private $sname;
    private $email;

    public function __construct($id, $fname, $sname, $email){
        $this->id = $id;
        $this->fname = $fname;
        $this->sname = $sname;
        $this->email = $email;
    }

    #getters
    public function getID{
        return $this->id;
    }
    public function getFname{
        return $this->fname;
    }
    public function getSname{
        return $this->sname;
    }
    public function getEmail{
        return $this->email;
    }
    #setters
    public function setID($id){
        $this->id = $id;
    }
    public function setFname($fname){
        $this->fname = $fname;
    }
    public function setSname($sname){
        $this->sname = $sname;
    }
    public function setEmail($email){
        $this->email = $email;
    }
}