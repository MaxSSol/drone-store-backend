<?php

namespace app\Http\Controllers;

use app\Models\Category;
use app\Models\ProductCategory;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = new Category();
        $categories = $categories->getAllCategories();
        echo $this->json->toJson($categories);
    }

    public function show($id)
    {
        $category = new Category();
        $category = $category->getCategoryById($id);
        echo $this->json->toJson($category);
    }

    public function categoryProducts($id)
    {
        $products = new ProductCategory();
        $products = $products->getCategoryProductsById($id);
        echo $this->json->toJson($products);
    }
}