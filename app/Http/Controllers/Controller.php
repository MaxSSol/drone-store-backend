<?php

namespace app\Http\Controllers;

use app\Helpers\JsonSerializer;

abstract class Controller
{
    protected JsonSerializer $json;

    public function __construct()
    {
        $this->json = new JsonSerializer();
    }
}