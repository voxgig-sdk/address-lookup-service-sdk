# AddressLookupService SDK utility: feature_add
module AddressLookupServiceUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
