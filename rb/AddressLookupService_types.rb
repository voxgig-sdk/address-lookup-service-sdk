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
# @!attribute [rw] address
#   @return [Hash, nil]
#
# @!attribute [rw] validation_information
#   @return [Hash, nil]
SearchAddressesGet = Struct.new(
  :address,
  :validation_information,
  keyword_init: true
)

# Request payload for SearchAddressesGet#list.
#
# @!attribute [rw] address
#   @return [Hash, nil]
#
# @!attribute [rw] validation_information
#   @return [Hash, nil]
SearchAddressesGetListMatch = Struct.new(
  :address,
  :validation_information,
  keyword_init: true
)

# SearchAddressesPost entity data model.
#
# @!attribute [rw] n
#   @return [Integer, nil]
#
# @!attribute [rw] q
#   @return [String]
#
# @!attribute [rw] suggested_address
#   @return [Array, nil]
SearchAddressesPost = Struct.new(
  :n,
  :q,
  :suggested_address,
  keyword_init: true
)

# Request payload for SearchAddressesPost#create.
#
# @!attribute [rw] n
#   @return [Integer, nil]
#
# @!attribute [rw] q
#   @return [String]
#
# @!attribute [rw] suggested_address
#   @return [Array, nil]
SearchAddressesPostCreateData = Struct.new(
  :n,
  :q,
  :suggested_address,
  keyword_init: true
)

