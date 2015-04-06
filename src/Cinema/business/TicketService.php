<?php

namespace Cinema\Business;

use Cinema\Data\TicketDAO;
use Cinema\Data\ScreenDAO;



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
}