<?php

namespace app\Models;

use app\Lib\Database;

abstract class ActiveRecord
{
    protected Database $db;
    protected array $hidden = [];

    public function __construct()
    {
        $this->db = new Database();
    }

    abstract protected function getTableName();

    public function getHidden(): array
    {
        return $this->hidden;
    }

    protected function getParamsForDB($params): array
    {
        $paramToDB = [];
        if (count($params) > 1) {
            if (is_array($params) && !empty($params)) {
                foreach ($params as $key => $items) {
                    $tempArr = [];
                    foreach ($items as $index => $value) {
                        $bindParam = ':' . $index;
                        $tempArr[$bindParam] = $value;
                    }
                    $paramToDB[] = $tempArr;
                }
            }
            return $paramToDB;
        }
        if (is_array($params) && !empty($params)) {
            foreach ($params as $key => $value) {
                $bindParam = ':' . $key;
                $paramToDB[$bindParam] = $value;
            }
        }
        return $paramToDB;
    }
}