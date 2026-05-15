# ArulsIp SDK utility: make_context
require_relative '../core/context'
module ArulsIpUtilities
  MakeContext = ->(ctxmap, basectx) {
    ArulsIpContext.new(ctxmap, basectx)
  }
end
