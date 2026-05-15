<?php
declare(strict_types=1);

// ArulsIp SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class ArulsIpFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new ArulsIpBaseFeature();
            case "test":
                return new ArulsIpTestFeature();
            default:
                return new ArulsIpBaseFeature();
        }
    }
}
