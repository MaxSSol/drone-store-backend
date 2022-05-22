<?php

namespace app\Models;

class ProductCategory extends ActiveRecord
{
    protected int $product_id;
    protected string $title;
    protected string $filename;
    protected int $price;

    protected function getTableName()
    {
        return 'product';
    }

    public function getCategoryProductsById($id)
    {
        $sql = 'SELECT p.product_id, p.title, p.price, pp.filename FROM products p 
                INNER JOIN category_product cp on p.product_id = cp.product_id 
                INNER JOIN product_photo pp on p.product_id = pp.product_id 
                WHERE cp.category_id = :category_id';
        $params = $this->getParamsForDB(['category_id' => $id]);
        return $this->db->query($sql, static::class, $params);
    }
}