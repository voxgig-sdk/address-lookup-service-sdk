<?php
declare(strict_types=1);

// AddressLookupService SDK base feature

class AddressLookupServiceBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(AddressLookupServiceContext $ctx, array $options): void {}
    public function PostConstruct(AddressLookupServiceContext $ctx): void {}
    public function PostConstructEntity(AddressLookupServiceContext $ctx): void {}
    public function SetData(AddressLookupServiceContext $ctx): void {}
    public function GetData(AddressLookupServiceContext $ctx): void {}
    public function GetMatch(AddressLookupServiceContext $ctx): void {}
    public function SetMatch(AddressLookupServiceContext $ctx): void {}
    public function PrePoint(AddressLookupServiceContext $ctx): void {}
    public function PreSpec(AddressLookupServiceContext $ctx): void {}
    public function PreRequest(AddressLookupServiceContext $ctx): void {}
    public function PreResponse(AddressLookupServiceContext $ctx): void {}
    public function PreResult(AddressLookupServiceContext $ctx): void {}
    public function PreDone(AddressLookupServiceContext $ctx): void {}
    public function PreUnexpected(AddressLookupServiceContext $ctx): void {}
}
