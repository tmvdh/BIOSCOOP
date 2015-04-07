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


class UserDAO
{

    public function addUser($fname, $sname, $email)
    {
        $sql = "insert into users (Fname, Sname, Email) values ($fname, $sname, $email)";
        $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        if ($dbh->query($sql) === TRUE) {
            $last_id = $dbh->insert_id;
            return $last_id;
            }
        $dbh = null;
    }
}