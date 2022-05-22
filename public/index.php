<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
use app\Http\Router\Router;

require_once __DIR__ . '/../vendor/autoload.php';


Router::route('/api/products', [new \app\Http\Controllers\ProductController(), 'index']);
Router::route('/api/products/(\w+)', [new \app\Http\Controllers\ProductController(), 'show']);
Router::route('/api/products/category/(\w+)', [new \app\Http\Controllers\ProductController(), 'categoryProducts']);

Router::route('/api/categories', [new \app\Http\Controllers\CategoryController(), 'index']);
Router::route('/api/categories/(\w+)', [new \app\Http\Controllers\CategoryController(), 'show']);
Router::route('/api/categories/products/(\w+)', [new \app\Http\Controllers\CategoryController(), 'categoryProducts']);


Router::route('/api/orders', [new \app\Http\Controllers\OrderController(), 'index']);
Router::route('/api/orders/(\w+)', [new \app\Http\Controllers\OrderController(), 'show']);
Router::route('/api/orders/add', [new \app\Http\Controllers\OrderController(), 'store'], 'POST');

Router::route('/api/favorites', [new \app\Http\Controllers\FavoriteController(), 'index']);
Router::route('/api/favorites/add', [new \app\Http\Controllers\FavoriteController(), 'addToFavorites'], 'POST');
Router::route('/api/favorites/remove', [new \app\Http\Controllers\FavoriteController(), 'removeFromFavorites'], 'POST');

Router::execute();