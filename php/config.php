<?php
declare(strict_types=1);

// AddressLookupService SDK configuration

class AddressLookupServiceConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "AddressLookupService",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://www.als.ogcio.gov.hk/lookup",
                "auth" => [
                    "prefix" => "Bearer",
                ],
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "search_addresses_get" => [],
                    "search_addresses_post" => [],
                ],
            ],
            "entity" => [
        'search_addresses_get' => [
          'fields' => [
            [
              'name' => 'address',
              'req' => false,
              'type' => '`$OBJECT`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'validation_information',
              'req' => false,
              'type' => '`$OBJECT`',
              'active' => true,
              'index$' => 1,
            ],
          ],
          'name' => 'search_addresses_get',
          'op' => [
            'list' => [
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'example' => 10,
                        'kind' => 'query',
                        'name' => 'n',
                        'orig' => 'n',
                        'reqd' => false,
                        'type' => '`$INTEGER`',
                        'active' => true,
                      ],
                      [
                        'example' => '香港中環皇后大道中1號',
                        'kind' => 'query',
                        'name' => 'q',
                        'orig' => 'q',
                        'reqd' => true,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/',
                  'select' => [
                    'exist' => [
                      'n',
                      'q',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'parts' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'list',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'search_addresses_post' => [
          'fields' => [
            [
              'name' => 'n',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'q',
              'req' => true,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'suggested_address',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 2,
            ],
          ],
          'name' => 'search_addresses_post',
          'op' => [
            'create' => [
              'name' => 'create',
              'points' => [
                [
                  'method' => 'POST',
                  'orig' => '/',
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'parts' => [],
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'create',
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
        return AddressLookupServiceFeatures::make_feature($name);
    }
}
