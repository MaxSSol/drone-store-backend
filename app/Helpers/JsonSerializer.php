<?php

namespace app\Helpers;

use ReflectionClass;
use stdClass;

class JsonSerializer
{
    public function toJson($obj): string
    {

        if (is_array($obj)) {
            return $this->fromArray($obj);
        }

        return json_encode($this->getValues($obj));
    }

    protected function fromArray($objects): string
    {
        $array = [];
        foreach ($objects as $obj) {
            $array[] = $this->getValues($obj);
        }

        return json_encode($array);
    }

    /**
     * @throws \ReflectionException
     */
    protected function getValues($obj): array
    {
        $reflectionClass = new ReflectionClass($obj);

        $reflectionProperties = $reflectionClass->getProperties();
        $arrayValues = [];
        $hidden = [...$obj->getHidden(), 'hidden', 'db'];
        foreach ($reflectionProperties as $property) {
            if (!in_array($property->getName(), $hidden)) {
                $property->setAccessible(true);
                $arrayValues[$property->getName()] = $property->getValue($obj);
            }
        }
        return $arrayValues;
    }
}