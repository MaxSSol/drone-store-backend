<?php

namespace app\Http\Controllers;

use app\Models\Favorites;

class FavoriteController extends Controller
{
    public function index()
    {
        $favorites = new Favorites();
        $favorites = $favorites->getAllFavorites();
        echo $this->json->toJson($favorites);
    }

    public function addToFavorites()
    {
        $productId = $_POST['product_id'];
        $favorite = new Favorites();
        $favorite = $favorite->addToFavorite($productId);
        echo is_string($favorite) ? json_encode(['status' => $favorite]) : json_encode(['status' => 'Ok']);
    }

    public function removeFromFavorites()
    {
        $productId = $_POST['product_id'];
        $favorite = new Favorites();
        $favorite = $favorite->removeFromFavorites($productId);
        echo count($favorite) === 0 ? json_encode(['status' => 'Ok']) : json_encode($favorite);
    }
}