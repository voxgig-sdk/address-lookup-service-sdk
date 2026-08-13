// Typed models for the AddressLookupService SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface SearchAddressesGet {
  Address?: Record<string, any>
  ValidationInformation?: Record<string, any>
}

export interface SearchAddressesGetListMatch {
  Address?: Record<string, any>
  ValidationInformation?: Record<string, any>
}

export interface SearchAddressesPost {
  SuggestedAddress?: any[]
  n?: number
  q: string
}

export interface SearchAddressesPostCreateData {
  SuggestedAddress?: any[]
  n?: number
  q: string
}

