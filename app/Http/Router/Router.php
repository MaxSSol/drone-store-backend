<?php

namespace app\Http\Router;

class Router
{
    private static array $routes = [];

    public static function route($pattern, $callback, $method = 'GET'): void
    {
        $pattern = '/^' . str_replace('/', '\/',$pattern) . '$/';
        self::$routes[$method][$pattern] = $callback;
    }

    public static function execute()
    {
        try {
            $url = $_SERVER['REQUEST_URI'];
            if ($_SERVER['REQUEST_METHOD'] === 'GET') {
                foreach (self::$routes['GET'] as $pattern => $callback) {
                    if (preg_match($pattern, $url, $params)) {
                        array_shift($params);
                        return call_user_func_array($callback, $params);
                    }
                }
            }
            foreach (self::$routes['POST'] as $pattern => $callback) {
                if (preg_match($pattern, $url, $params)) {
                    array_shift($params);
                    return call_user_func_array($callback,  $_POST);
                }
            }
            throw new \Exception('404 Page not Found');
        } catch (\Exception $e) {
            echo $e->getMessage();
        }
    }
}