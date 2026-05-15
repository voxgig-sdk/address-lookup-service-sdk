<?php
declare(strict_types=1);

// AddressLookupService SDK utility: feature_add

class AddressLookupServiceFeatureAdd
{
    public static function call(AddressLookupServiceContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
