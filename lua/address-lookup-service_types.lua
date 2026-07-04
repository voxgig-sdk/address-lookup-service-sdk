-- Typed models for the AddressLookupService SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class SearchAddressesGet
---@field address? table
---@field validation_information? table

---@class SearchAddressesGetListMatch

---@class SearchAddressesPost
---@field n? number
---@field q string
---@field suggested_address? table

---@class SearchAddressesPostCreateData

local M = {}

return M
