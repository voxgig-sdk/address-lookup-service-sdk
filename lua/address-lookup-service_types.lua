-- Typed models for the AddressLookupService SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class SearchAddressesGet
---@field Address? table
---@field ValidationInformation? table

---@class SearchAddressesGetListMatch
---@field Address? table
---@field ValidationInformation? table

---@class SearchAddressesPost
---@field SuggestedAddress? table
---@field n? number
---@field q string

---@class SearchAddressesPostCreateData
---@field SuggestedAddress? table
---@field n? number
---@field q string

local M = {}

return M
