<?php
declare(strict_types=1);

// AddressLookupService SDK exists test

require_once __DIR__ . '/../addresslookupservice_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = AddressLookupServiceSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
