<?php
declare(strict_types=1);

// AddressLookupService SDK utility: prepare_body

class AddressLookupServicePrepareBody
{
    public static function call(AddressLookupServiceContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
