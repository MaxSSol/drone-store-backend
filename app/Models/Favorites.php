<?php

namespace app\Models;

use app\Models\ActiveRecord;

class Favorites extends ActiveRecord
{
    protected int $product_id;
    protected int $customer_id;
    protected string $title;
    protected int $price;
    protected int $photo_id;
    protected string $filename;

    protected function getTableName(): string
    {
        return 'favorites';
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
     * @return int
     */
    public function getPhotoId(): int
    {
        return $this->photo_id;
    }

    /**
     * @param int $photo_id
     */
    public function setPhotoId(int $photo_id): void
    {
        $this->photo_id = $photo_id;
    }

    /**
     * @return string
     */
    public function getFilename(): string
    {
        return $this->filename;
    }

    /**
     * @param string $filename
     */
    public function setFilename(string $filename): void
    {
        $this->filename = $filename;
    }

    public function getAllFavorites()
    {
        $sql = 'SELECT * FROM ' .
            $this->getTableName() .
            ' INNER JOIN products p on favorites.product_id = p.product_id ' .
            ' INNER JOIN product_photo pp on p.product_id = pp.product_id ' .
            'WHERE customer_id = 1';
        return $this->db->query($sql, static::class);
    }

    public function existFavorite($product_id): bool
    {
        $sql = 'SELECT * FROM ' .
            $this->getTableName() .
            ' WHERE customer_id = 1 AND product_id = :product_id';
        $params = $this->getParamsForDB(['product_id' => $product_id]);
        $result = $this->db->query($sql, static::class, $params);
        if (!empty($result)) {
            return true;
        }
        return false;
    }

    public function addToFavorite($product_id)
    {
        if (!$this->existFavorite($product_id)) {
            $sql = 'INSERT INTO ' .
                $this->getTableName() .
                ' (`customer_id`, `product_id`) ' .
                ' VALUES (' .
                ' 1, :product_id )';
            $params = $this->getParamsForDB(['product_id' => $product_id]);

            return $this->db->query($sql, static::class, $params);
        }

        return 'Product exist';
    }

    public function removeFromFavorites($product_id)
    {
        $sql = 'DELETE FROM ' .
            $this->getTableName() .
            ' WHERE customer_id = 1 AND product_id = :product_id';
        $params = $this->getParamsForDB(['product_id' => $product_id]);

        return $this->db->query($sql, static::class, $params);
    }
}