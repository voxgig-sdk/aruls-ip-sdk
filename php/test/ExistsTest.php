<?php
declare(strict_types=1);

// ArulsIp SDK exists test

require_once __DIR__ . '/../arulsip_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = ArulsIpSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
