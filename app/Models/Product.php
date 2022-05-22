<?php

namespace app\Models;

use app\Models\ActiveRecord;

class Product extends ActiveRecord
{
    protected int $product_id;
    protected string $title;
    protected string $description;
    protected int $amount;
    protected int $price;
    protected bool $available;
    protected string $created_at;
    protected string $updated_at;
    protected int $photo_id;
    protected string $filename;
    protected array $hidden = [
        'created_at',
        'updated_at'
    ];

    /**
     * @return string
     */
    protected function getTableName(): string
    {
        return 'products';
    }

    /**
     * @return int
     */
    public function getProductId(): int
    {
        return $this->product_id;
    }

    /**
     * @param int $product_id
     */
    public function setProductId(int $product_id): void
    {
        $this->product_id = $product_id;
    }

    /**
     * @return string
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * @param string $title
     */
    public function setTitle(string $title): void
    {
        $this->title = $title;
    }

    /**
     * @return string
     */
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    /**
     * @return int
     */
    public function getAmount(): int
    {
        return $this->amount;
    }

    /**
     * @param int $amount
     */
    public function setAmount(int $amount): void
    {
        $this->amount = $amount;
    }

    /**
     * @return int
     */
    public function getPrice(): int
    {
        return $this->price;
    }

    /**
     * @param int $price
     */
    public function setPrice(int $price): void
    {
        $this->price = $price;
    }

    /**
     * @return bool
     */
    public function isAvailable(): bool
    {
        return $this->available;
    }

    /**
     * @param bool $available
     */
    public function setAvailable(bool $available): void
    {
        $this->available = $available;
    }

    /**
     * @return string
     */
    public function getCreatedAt(): string
    {
        return $this->created_at;
    }

    /**
     * @param string $created_at
     */
    public function setCreatedAt(string $created_at): void
    {
        $this->created_at = $created_at;
    }

    /**
     * @return string
     */
    public function getUpdatedAt(): string
    {
        return $this->updated_at;
    }

    /**
     * @param string $updated_at
     */
    public function setUpdatedAt(string $updated_at): void
    {
        $this->updated_at = $updated_at;
    }

    public function getAllProducts()
    {
        $sql = 'SELECT * FROM ' .
            $this->getTableName() .
            ' INNER JOIN product_photo pp on products.product_id = pp.product_id';
        return $this->db->query($sql, static::class);
    }

    public function getProductById($id)
    {
        $sql = 'SELECT * FROM ' .
            $this->getTableName() .
            ' p ' .
            ' INNER JOIN product_photo pp on p.product_id = pp.product_id WHERE p.product_id = :product_id';
        $params = $this->getParamsForDB(['product_id' => $id]);
        $result = $this->db->query($sql, static::class, $params);
        return $result ? $result[0] : null;
    }

    public function getProductsByCategroyId($id)
    {
        $sql = 'SELECT * FROM ' .
            $this->getTableName() .
            ' p ' .
            ' INNER JOIN category_product cp on p.product_id = cp.product_id ' .
            ' INNER JOIN product_photo pp on p.product_id = pp.product_id ' .
            'WHERE cp.category_id = :category_id';
        $params = $this->getParamsForDB(['category_id' => $id]);
        return $this->db->query($sql, static::class, $params);
    }

    public function checkAmount(array $products)
    {
        $results = [];
        foreach ($products as $product) {
            $prod = $this->getProductById($product['product_id']);
            if ($prod->getAmount() < $product['amount']) {
                $results[] = [$prod->getTitle() => $prod->getAmount()];
            }
        }
        return $results;
    }
}