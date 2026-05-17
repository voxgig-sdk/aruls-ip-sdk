# ArulsIp SDK context

require_relative '../utility/struct/voxgig_struct'
require_relative 'control'
require_relative 'operation'
require_relative 'spec'
require_relative 'result'
require_relative 'response'
require_relative 'error'
require_relative 'helpers'

class ArulsIpContext
  attr_accessor :id, :out, :client, :utility, :ctrl, :meta, :config,
                :entopts, :options, :entity, :shared, :opmap,
                :data, :reqdata, :match, :reqmatch, :point,
                :spec, :result, :response, :op

  def initialize(ctxmap = {}, basectx = nil)
    ctxmap ||= {}
    @id = "C#{rand(10000000..99999999)}"
    @out = {}

    @client = ArulsIpHelpers.get_ctx_prop(ctxmap, "client") || basectx&.client
    @utility = ArulsIpHelpers.get_ctx_prop(ctxmap, "utility") || basectx&.utility

    @ctrl = ArulsIpControl.new
    ctrl_raw = ArulsIpHelpers.get_ctx_prop(ctxmap, "ctrl")
    if ctrl_raw.is_a?(Hash)
      @ctrl.throw_err = ctrl_raw["throw"] if ctrl_raw.key?("throw")
      @ctrl.explain = ctrl_raw["explain"] if ctrl_raw["explain"].is_a?(Hash)
    elsif basectx&.ctrl
      @ctrl = basectx.ctrl
    end

    m = ArulsIpHelpers.get_ctx_prop(ctxmap, "meta")
    @meta = m.is_a?(Hash) ? m : (basectx&.meta || {})

    cfg = ArulsIpHelpers.get_ctx_prop(ctxmap, "config")
    @config = cfg.is_a?(Hash) ? cfg : basectx&.config

    eo = ArulsIpHelpers.get_ctx_prop(ctxmap, "entopts")
    @entopts = eo.is_a?(Hash) ? eo : basectx&.entopts

    o = ArulsIpHelpers.get_ctx_prop(ctxmap, "options")
    @options = o.is_a?(Hash) ? o : basectx&.options

    e = ArulsIpHelpers.get_ctx_prop(ctxmap, "entity")
    @entity = e || basectx&.entity

    s = ArulsIpHelpers.get_ctx_prop(ctxmap, "shared")
    @shared = s.is_a?(Hash) ? s : basectx&.shared

    om = ArulsIpHelpers.get_ctx_prop(ctxmap, "opmap")
    @opmap = om.is_a?(Hash) ? om : (basectx&.opmap || {})

    @data = ArulsIpHelpers.to_map(ArulsIpHelpers.get_ctx_prop(ctxmap, "data")) || {}
    @reqdata = ArulsIpHelpers.to_map(ArulsIpHelpers.get_ctx_prop(ctxmap, "reqdata")) || {}
    @match = ArulsIpHelpers.to_map(ArulsIpHelpers.get_ctx_prop(ctxmap, "match")) || {}
    @reqmatch = ArulsIpHelpers.to_map(ArulsIpHelpers.get_ctx_prop(ctxmap, "reqmatch")) || {}

    pt = ArulsIpHelpers.get_ctx_prop(ctxmap, "point")
    @point = pt.is_a?(Hash) ? pt : basectx&.point

    sp = ArulsIpHelpers.get_ctx_prop(ctxmap, "spec")
    @spec = sp.is_a?(ArulsIpSpec) ? sp : basectx&.spec

    r = ArulsIpHelpers.get_ctx_prop(ctxmap, "result")
    @result = r.is_a?(ArulsIpResult) ? r : basectx&.result

    rp = ArulsIpHelpers.get_ctx_prop(ctxmap, "response")
    @response = rp.is_a?(ArulsIpResponse) ? rp : basectx&.response

    opname = ArulsIpHelpers.get_ctx_prop(ctxmap, "opname") || ""
    @op = resolve_op(opname)
  end

  def resolve_op(opname)
    # Cache key is `<entity>:<opname>` so two entities with the same op
    # (e.g. both have a "list") get distinct cached Operations. Keying
    # on opname alone caused the first-resolved entity's points to be
    # served to every subsequent entity's call.
    entname = @entity&.respond_to?(:get_name) ? @entity.get_name : "_"
    cache_key = "#{entname}:#{opname}"
    return @opmap[cache_key] if @opmap[cache_key]
    return ArulsIpOperation.new({}) if opname.empty?

    opcfg = VoxgigStruct.getpath(@config, "entity.#{entname}.op.#{opname}")

    input = (opname == "update" || opname == "create") ? "data" : "match"

    points = []
    if opcfg.is_a?(Hash)
      t = VoxgigStruct.getprop(opcfg, "points")
      points = t if t.is_a?(Array)
    end

    op = ArulsIpOperation.new({
      "entity" => entname,
      "name" => opname,
      "input" => input,
      "points" => points,
    })
    @opmap[cache_key] = op
    op
  end

  def make_error(code, msg)
    ArulsIpError.new(code, msg, self)
  end
end
