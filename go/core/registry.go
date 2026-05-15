package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewSearchAddressesGetEntityFunc func(client *AddressLookupServiceSDK, entopts map[string]any) AddressLookupServiceEntity

var NewSearchAddressesPostEntityFunc func(client *AddressLookupServiceSDK, entopts map[string]any) AddressLookupServiceEntity

