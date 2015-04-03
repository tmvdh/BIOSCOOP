<?php
/**
 * Created by PhpStorm.
 * User: tom.vanderheijden
 * Date: 1/04/2015
 * Time: 14:55
 */

namespace Cinema\Data;

use PDO;
use Cinema\Data\DBConfig;


class ScreenDAO {

    public function getScreen($id){
            $sql = "select Seats, Width from screens where Screen_ID = $id"
            $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
            $resultSet = $dbh->query($sql);
            $result = $resultSet->fetch();
            return $result;
            $dbh = null;

}