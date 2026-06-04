<?php
declare(strict_types=1);

// ArulsIp SDK configuration

class ArulsIpConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "ArulsIp",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://api.aruljohn.com",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "ip_address" => [],
                    "ipn" => [],
                ],
            ],
            "entity" => [
        'ip_address' => [
          'fields' => [
            [
              'name' => 'ip',
              'req' => true,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
          ],
          'name' => 'ip_address',
          'op' => [
            'load' => [
              'name' => 'load',
              'points' => [
                [
                  'method' => 'GET',
                  'orig' => '/ip/json',
                  'parts' => [
                    'ip',
                    'json',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'ipn' => [
          'fields' => [],
          'name' => 'ipn',
          'op' => [
            'load' => [
              'name' => 'load',
              'points' => [
                [
                  'method' => 'GET',
                  'orig' => '/ip',
                  'parts' => [
                    'ip',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return ArulsIpFeatures::make_feature($name);
    }
}
