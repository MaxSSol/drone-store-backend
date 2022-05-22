<?php

namespace app\Http\Controllers;

use app\Models\Order;

class OrderController extends Controller
{
    public function index()
    {
        $orders = new Order();
        $orders = $orders->getAllOrders();
        echo $this->json->toJson($orders);
    }

    public function show($id)
    {
        $order = new Order();
        $order = $order->getOrderById($id);
        echo $this->json->toJson($order);
    }

    public function store()
    {
        $data = $_POST;
        $products = [];
        foreach ($data as $item) {
            $products[] = $item;
        }
        $order = new Order();
        $order = $order->addOrder($products);
        echo count($order) === 0 ? json_encode(['status' => 'Ok']) : json_encode($order);
    }

}