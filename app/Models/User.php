<?php

namespace app\Models;

use app\Models\ActiveRecord;

class User extends ActiveRecord
{
    protected int $customer_id;
    protected string $first_name;
    protected string $last_name;
    protected ?string $email;
    protected ?string $password;
    protected string $tel;
    protected string $status;
    protected string $created_at;
    protected string $updated_at;


    protected array $hidden = [
        'password',
        'created_at',
        'updated_at'
    ];

    protected function getTableName(): string
    {
        return 'customers';
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
    public function getFirstName(): string
    {
        return $this->first_name;
    }

    /**
     * @param string $first_name
     */
    public function setFirstName(string $first_name): void
    {
        $this->first_name = $first_name;
    }

    /**
     * @return string
     */
    public function getLastName(): string
    {
        return $this->last_name;
    }

    /**
     * @param string $last_name
     */
    public function setLastName(string $last_name): void
    {
        $this->last_name = $last_name;
    }

    /**
     * @return string|null
     */
    public function getEmail(): ?string
    {
        return $this->email;
    }

    /**
     * @param string|null $email
     */
    public function setEmail(?string $email): void
    {
        $this->email = $email;
    }


    /**
     * @param string|null $password
     */
    public function setPassword(?string $password): void
    {
        $this->password = $password;
    }

    /**
     * @return string
     */
    public function getTel(): string
    {
        return $this->tel;
    }

    /**
     * @param string $tel
     */
    public function setTel(string $tel): void
    {
        $this->tel = $tel;
    }

    /**
     * @return string
     */
    public function getStatus(): string
    {
        return $this->status;
    }

    /**
     * @param string $status
     */
    public function setStatus(string $status): void
    {
        $this->status = $status;
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

    /**
     * @return array|string[]
     */
    public function getHidden(): array
    {
        return $this->hidden;
    }

    /**
     * @param array|string[] $hidden
     */
    public function setHidden(array $hidden): void
    {
        $this->hidden = $hidden;
    }

    public function getAllCustomers()
    {
        $sql = 'SELECT * FROM ' . $this->getTableName();
        return $this->db->query($sql, static::class);
    }

    public function getAllRegisterCustomers()
    {
        $sql = 'SELECT * FROM ' . $this->getTableName() . ' WHERE status = \'register\'';
        return $this->db->query($sql, static::class);
    }

    public function getAllNotRegisterCustomers()
    {
        $sql = 'SELECT * FROM ' . $this->getTableName() . ' WHERE status = \'not register\'';
        return $this->db->query($sql, static::class);
    }
}