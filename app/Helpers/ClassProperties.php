<?php

namespace app\Helpers;

class ClassProperties
{
    public function getProperties($obj): array
    {
        $properties = [];
        $reflection = new \ReflectionClass($obj);
        $reflectionProperties = $reflection->getProperties();
        foreach ($reflectionProperties as $property) {
            $properties[] = $property->getName();
        }
        return $properties;
    }
}