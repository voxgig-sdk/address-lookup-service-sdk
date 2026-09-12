<?php
declare(strict_types=1);

// AddressLookupService SDK configuration

class AddressLookupServiceConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "AddressLookupService",
                "slug" => "address-lookup-service",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
            ],
            "options" => [
                "base" => "https://www.als.ogcio.gov.hk/lookup",
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
              'name' => 'Address',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'ValidationInformation',
              'type' => '`$OBJECT`',
            ],
          ],
          'name' => 'search_addresses_get',
          'op' => [
            'list' => [
              'input' => 'data',
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
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'example' => '香港中環皇后大道中1號',
                        'kind' => 'query',
                        'name' => 'q',
                        'orig' => 'q',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/',
                  'segments' => [],
                  'select' => [
                    'exist' => [
                      'n',
                      'q',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.SuggestedAddress`',
                  ],
                  'parts' => [],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'search_addresses_post' => [
          'fields' => [
            [
              'name' => 'SuggestedAddress',
              'short' => 'List of suggested addresses matching the query',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'n',
              'short' => 'Number of records to return',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'q',
              'req' => true,
              'short' => 'Free-text address query string',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'search_addresses_post',
          'op' => [
            'create' => [
              'input' => 'data',
              'name' => 'create',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'POST',
                  'orig' => '/',
                  'segments' => [],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'parts' => [],
                ],
              ],
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
