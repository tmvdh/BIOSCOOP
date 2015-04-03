<?php

namespace Cinema\Business;

use Cinema\Data\TicketDAO;



class TicketService {

    public function getAllTickets($Show_ID){

        $TicketDAO = new TicketDAO();
        $seating = $TicketDAO->getAllTickets($Show_ID);
        return $seating;
    }
}