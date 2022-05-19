<?php

namespace app\Http\Controllers;

use app\Models\Category;

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
}