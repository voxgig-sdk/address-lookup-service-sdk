<?php
declare(strict_types=1);

// AddressLookupService SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class AddressLookupServiceMakeContext
{
    public static function call(array $ctxmap, ?AddressLookupServiceContext $basectx): AddressLookupServiceContext
    {
        return new AddressLookupServiceContext($ctxmap, $basectx);
    }
}
