-- AddressLookupService SDK error

local AddressLookupServiceError = {}
AddressLookupServiceError.__index = AddressLookupServiceError


function AddressLookupServiceError.new(code, msg, ctx)
  local self = setmetatable({}, AddressLookupServiceError)
  self.is_sdk_error = true
  self.sdk = "AddressLookupService"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function AddressLookupServiceError:error()
  return self.msg
end


function AddressLookupServiceError:__tostring()
  return self.msg
end


return AddressLookupServiceError
