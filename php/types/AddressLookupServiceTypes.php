<?php
declare(strict_types=1);

// Typed models for the AddressLookupService SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** SearchAddressesGet entity data model. */
class SearchAddressesGet
{
    public ?array $address = null;
    public ?array $validation_information = null;
}

/** Match filter for SearchAddressesGet#list (any subset of SearchAddressesGet fields). */
class SearchAddressesGetListMatch
{
    public ?array $address = null;
    public ?array $validation_information = null;
}

/** SearchAddressesPost entity data model. */
class SearchAddressesPost
{
    public ?int $n = null;
    public string $q;
    public ?array $suggested_address = null;
}

/** Match filter for SearchAddressesPost#create (any subset of SearchAddressesPost fields). */
class SearchAddressesPostCreateData
{
    public ?int $n = null;
    public ?string $q = null;
    public ?array $suggested_address = null;
}

