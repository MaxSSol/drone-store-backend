<?php

namespace app\Http\Controllers;

use app\Models\Product;

class ProductController extends Controller
{
    public function index()
    {
        $products = new Product();
        $products = $products->getAllProducts();
        echo $this->json->toJson($products);
    }

    public function show($id)
    {
        $product = new Product();
        $product = $product->getProductById($id);
        echo $this->json->toJson($product);
    }

    public function categoryProducts($id)
    {
        $product = new Product();
        $product = $product->getProductsByCategroyId($id);
        echo $this->json->toJson($product);
    }
}