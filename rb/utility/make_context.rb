# AddressLookupService SDK utility: make_context
require_relative '../core/context'
module AddressLookupServiceUtilities
  MakeContext = ->(ctxmap, basectx) {
    AddressLookupServiceContext.new(ctxmap, basectx)
  }
end
