<?php

namespace app\Models;

use app\Models\ActiveRecord;
use app\Models\Product;
use DateTime;

class Order extends ActiveRecord
{
    protected int $order_id;
    protected int $customer_id;
    protected string $date;

    protected function getTableName(): string
    {
        return '`order`';
    }

    /**
     * @return int
     */
    public function getOrderId(): int
    {
        return $this->order_id;
    }

    /**
     * @param int $order_id
     */
    public function setOrderId(int $order_id): void
    {
        $this->order_id = $order_id;
    }

    /**
     * @return int
     */
    public function getCustomerId(): int
    {
        return $this->customer_id;
    }

    /**
     * @param int $customer_id
     */
    public function setCustomerId(int $customer_id): void
    {
        $this->customer_id = $customer_id;
    }

    /**
     * @return string
     */
    public function getDate(): string
    {
        return $this->date;
    }

    /**
     * @param string $date
     */
    public function setDate(string $date): void
    {
        $this->date = $date;
    }

    public function getAllOrders()
    {
        $sql = 'SELECT * FROM ' . $this->getTableName();
        return $this->db->query($sql, static::class);
    }

    public function getOrderById($id)
    {
        $sql = 'SELECT * FROM ' . $this->getTableName() . ' WHERE order_id = :order_id';
        $params = $this->getParamsForDB(['order_id' => $id]);
        return $this->db->query($sql, static::class, $params);
    }

    public function addOrder(array $products)
    {
        $productsAmount = new Product();
        $productsAmount = $productsAmount->checkAmount($products);
        if (empty($productsAmount)) {
            $date = new DateTime();
            $sql = 'INSERT INTO ' .
                $this->getTableName() .
                ' (customer_id, date) ' .
                'VALUES (' .
                '1' . ',' .
                'FROM_UNIXTIME(' . $date->getTimestamp() . ')' .
                ' )';
            $this->db->query($sql, static::class);
            $order_id = $this->db->getLastInsertId();

            $sql = 'INSERT INTO `order_product` ' .
                '(order_id, product_id, product_amount, product_price) ' .
                'VALUES (:order_id, :product_id, :amount, :price)';
            $productPrice = new Product();
            foreach ($products as $key => $product) {
                $productPrice = $productPrice->getProductById($product['product_id']);
                $product['price'] = $productPrice->getPrice();
                $products[$key] = $product;
            }

            $params = $this->getParamsForDB($products);
            foreach ($params as $param) {
                $param[':order_id'] = $order_id;
                $this->db->query($sql, static::class, $param);
            }

            $sql = 'UPDATE products SET amount = amount - :amount WHERE product_id = :product_id';
            foreach ($params as $param) {
                $newParam[':product_id'] = $param['product_id'];
                $newParam[':amount'] = $param['amount'];
                $result = $this->db->query($sql, static::class, $newParam);
            }
        }
        return $productsAmount;
    }

}