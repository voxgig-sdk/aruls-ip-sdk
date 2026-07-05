# frozen_string_literal: true

# Typed models for the ArulsIp SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# IpAddress entity data model.
#
# @!attribute [rw] ip
#   @return [String]
IpAddress = Struct.new(
  :ip,
  keyword_init: true
)

# Request payload for IpAddress#load.
#
# @!attribute [rw] ip
#   @return [String, nil]
IpAddressLoadMatch = Struct.new(
  :ip,
  keyword_init: true
)

# Ipn entity data model.
class Ipn
end

# Request payload for Ipn#load.
class IpnLoadMatch
end

