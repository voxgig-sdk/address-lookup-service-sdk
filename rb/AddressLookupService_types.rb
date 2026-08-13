# frozen_string_literal: true

# Typed models for the AddressLookupService SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# SearchAddressesGet entity data model.
#
# @!attribute [rw] Address
#   @return [Hash, nil]
#
# @!attribute [rw] ValidationInformation
#   @return [Hash, nil]
SearchAddressesGet = Struct.new(
  :Address,
  :ValidationInformation,
  keyword_init: true
)

# Request payload for SearchAddressesGet#list.
#
# @!attribute [rw] Address
#   @return [Hash, nil]
#
# @!attribute [rw] ValidationInformation
#   @return [Hash, nil]
SearchAddressesGetListMatch = Struct.new(
  :Address,
  :ValidationInformation,
  keyword_init: true
)

# SearchAddressesPost entity data model.
#
# @!attribute [rw] SuggestedAddress
#   @return [Array, nil]
#
# @!attribute [rw] n
#   @return [Integer, nil]
#
# @!attribute [rw] q
#   @return [String]
SearchAddressesPost = Struct.new(
  :SuggestedAddress,
  :n,
  :q,
  keyword_init: true
)

# Request payload for SearchAddressesPost#create.
#
# @!attribute [rw] SuggestedAddress
#   @return [Array, nil]
#
# @!attribute [rw] n
#   @return [Integer, nil]
#
# @!attribute [rw] q
#   @return [String]
SearchAddressesPostCreateData = Struct.new(
  :SuggestedAddress,
  :n,
  :q,
  keyword_init: true
)

