-- ArulsIp SDK error

local ArulsIpError = {}
ArulsIpError.__index = ArulsIpError


function ArulsIpError.new(code, msg, ctx)
  local self = setmetatable({}, ArulsIpError)
  self.is_sdk_error = true
  self.sdk = "ArulsIp"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function ArulsIpError:error()
  return self.msg
end


function ArulsIpError:__tostring()
  return self.msg
end


return ArulsIpError
