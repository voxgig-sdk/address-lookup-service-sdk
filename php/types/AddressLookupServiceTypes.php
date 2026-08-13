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
    public ?array $Address = null;
    public ?array $ValidationInformation = null;
}

/** Request payload for SearchAddressesGet#list. */
class SearchAddressesGetListMatch
{
    public ?array $Address = null;
    public ?array $ValidationInformation = null;
}

/** SearchAddressesPost entity data model. */
class SearchAddressesPost
{
    public ?array $SuggestedAddress = null;
    public ?int $n = null;
    public string $q;
}

/** Request payload for SearchAddressesPost#create. */
class SearchAddressesPostCreateData
{
    public ?array $SuggestedAddress = null;
    public ?int $n = null;
    public string $q;
}

