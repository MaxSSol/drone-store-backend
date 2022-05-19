<?php

namespace app\Lib;

use Symfony\Component\Dotenv\Dotenv;
use PDO;

class Database
{
    protected PDO $db;

    public function __construct()
    {
        $dotenv = new Dotenv();
        $dotenv->load(__DIR__ . '/../../.env');
        try {
            $this->db = new PDO(
                $_ENV['DRIVER'] .
                ':host=' .
                $_ENV['HOST'] .
                ';' .
                'dbname=' .
                $_ENV['DB_NAME'],
                $_ENV['USER'],
                $_ENV['PASSWORD']
            );

            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

        } catch (\PDOException $e) {
            echo 'Connection failed, ' . $e->getMessage();
        }
    }

    public function query(string $sql, $className = 'stdClass', array $params = [])
    {
        try {
            $stmt = $this->db->prepare($sql);
            $result = $stmt->execute($params);
            if (false === $result) {
                return null;
            }
            return $stmt->fetchAll(\PDO::FETCH_CLASS, $className);
        } catch (\PDOException $e) {
            echo $e->getMessage();
        }
    }

    public function getLastInsertId(): int
    {
        return $this->db->lastInsertId();
    }
}