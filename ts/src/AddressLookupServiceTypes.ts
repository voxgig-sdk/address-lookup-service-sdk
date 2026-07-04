// Typed models for the AddressLookupService SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface SearchAddressesGet {
  address?: Record<string, any>
  validation_information?: Record<string, any>
}

export type SearchAddressesGetListMatch = Partial<SearchAddressesGet>

export interface SearchAddressesPost {
  n?: number
  q: string
  suggested_address?: any[]
}

export type SearchAddressesPostCreateData = Partial<SearchAddressesPost>

