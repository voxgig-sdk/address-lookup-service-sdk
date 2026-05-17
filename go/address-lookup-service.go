package voxgigaddresslookupservicesdk

import (
	"github.com/voxgig-sdk/address-lookup-service-sdk/go/core"
	"github.com/voxgig-sdk/address-lookup-service-sdk/go/entity"
	"github.com/voxgig-sdk/address-lookup-service-sdk/go/feature"
	_ "github.com/voxgig-sdk/address-lookup-service-sdk/go/utility"
)

// Type aliases preserve external API.
type AddressLookupServiceSDK = core.AddressLookupServiceSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type AddressLookupServiceEntity = core.AddressLookupServiceEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type AddressLookupServiceError = core.AddressLookupServiceError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewSearchAddressesGetEntityFunc = func(client *core.AddressLookupServiceSDK, entopts map[string]any) core.AddressLookupServiceEntity {
		return entity.NewSearchAddressesGetEntity(client, entopts)
	}
	core.NewSearchAddressesPostEntityFunc = func(client *core.AddressLookupServiceSDK, entopts map[string]any) core.AddressLookupServiceEntity {
		return entity.NewSearchAddressesPostEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewAddressLookupServiceSDK = core.NewAddressLookupServiceSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
