<?php
declare(strict_types=1);

// AddressLookupService SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class AddressLookupServiceFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new AddressLookupServiceBaseFeature();
            case "test":
                return new AddressLookupServiceTestFeature();
            default:
                return new AddressLookupServiceBaseFeature();
        }
    }
}
