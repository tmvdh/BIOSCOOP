<?php

namespace Cinema\Business;

use Cinema\Data\TicketDAO;
use Cinema\Data\ScreenDAO;
use Cinema\Data\UserDAO;



class TicketService {

    public function getAllTickets($Show_ID){

        $TicketDAO = new TicketDAO();
        $tickets = $TicketDAO->getAllTickets($Show_ID);
        $ScreenDAO = new ScreenDAO();
        $screen = $ScreenDAO->getScreen($Show_ID);
        $seating = array_fill(1,$screen["Seats"], 0);
        foreach ($tickets as $ticket){
            $seating[$ticket] = 1;
        }
        return $seating;
    }

    public function addTicket($User_ID, $Show_ID, $Seat){
        $barcode = strtoupper(sha1($Show_ID . $Seat));
        $TicketDAO = new TicketDAO();
        $TicketDAO->addTicket($User_ID, $Show_ID, $Seat, $barcode);
        return $barcode;
    }

    public function addUser($fname, $sname, $email){
        $UserDAO = new UserDAO();
        $user = $UserDAO->addUser($fname, $sname, $email);
        return $user;
    }
}