<?php

namespace app\Models;

use app\Models\ActiveRecord;

class Category extends ActiveRecord
{
    protected int $category_id;
    protected string $title;
    protected string $created_at;
    protected string $updated_at;

    protected array $hidden = [
        'created_at',
        'updated_at'
    ];

    protected function getTableName()
    {
        return 'categories';
    }

    /**
     * @return int
     */
    public function getCategoryId(): int
    {
        return $this->category_id;
    }

    /**
     * @param int $category_id
     */
    public function setCategoryId(int $category_id): void
    {
        $this->category_id = $category_id;
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

    public function getAllCategories()
    {
        $sql = 'SELECT * FROM ' . $this->getTableName();
        return $this->db->query($sql, static::class);
    }

    public function getCategoryById($id)
    {
        $sql = 'SELECT * FROM ' . $this->getTableName() . ' WHERE category_id = :category_id';
        $params = $this->getParamsForDB(['category_id' => $id]);
        return $this->db->query($sql, static::class, $params);
    }
}