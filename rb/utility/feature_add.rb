# ArulsIp SDK utility: feature_add
module ArulsIpUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
