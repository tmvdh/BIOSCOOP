<?php
/**
 * Created by PhpStorm.
 * User: tom.vanderheijden
 * Date: 1/04/2015
 * Time: 14:56
 */

namespace Cinema\Data;

use PDO;
use Cinema\Data\DBConfig;
use Cinema\Entities\Ticket;


class TicketDAO {

        public function getTicket($id){
            $sql = "select * from tickets where Ticket_ID = $id";
            $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
            $resultSet = $dbh->query($sql);
            $result = $resultSet->fetch();
            $ticket = new Ticket($result["Ticket_ID"], $result["User_ID"], $result["Show_ID"], $result["Seat"]);
            $dbh = null;
            return $ticket;
        }

        public function addTicket($User_ID, $Show_ID, $Seat){
            $sql = "insert into tickets (UserID, Show_ID, Seat) values ($User_ID, $Show_ID, $Seat)";
            $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
            $dbh->exec($sql);
            $dbh = null;
        }

        public function getAllTickets($Show_ID){
            $list = array();
            $sql = "select Seat from tickets where Show_ID = $Show_ID ";
            $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
            $resultSet = $dbh->query($sql);
            foreach ($resultSet as $row){
                $seat = $row["Seat"];
                array_push($list, $seat);
            }
            return $list;
            $dbh = null;
        }
}
