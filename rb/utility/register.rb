# ArulsIp SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

ArulsIpUtility.registrar = ->(u) {
  u.clean = ArulsIpUtilities::Clean
  u.done = ArulsIpUtilities::Done
  u.make_error = ArulsIpUtilities::MakeError
  u.feature_add = ArulsIpUtilities::FeatureAdd
  u.feature_hook = ArulsIpUtilities::FeatureHook
  u.feature_init = ArulsIpUtilities::FeatureInit
  u.fetcher = ArulsIpUtilities::Fetcher
  u.make_fetch_def = ArulsIpUtilities::MakeFetchDef
  u.make_context = ArulsIpUtilities::MakeContext
  u.make_options = ArulsIpUtilities::MakeOptions
  u.make_request = ArulsIpUtilities::MakeRequest
  u.make_response = ArulsIpUtilities::MakeResponse
  u.make_result = ArulsIpUtilities::MakeResult
  u.make_point = ArulsIpUtilities::MakePoint
  u.make_spec = ArulsIpUtilities::MakeSpec
  u.make_url = ArulsIpUtilities::MakeUrl
  u.param = ArulsIpUtilities::Param
  u.prepare_auth = ArulsIpUtilities::PrepareAuth
  u.prepare_body = ArulsIpUtilities::PrepareBody
  u.prepare_headers = ArulsIpUtilities::PrepareHeaders
  u.prepare_method = ArulsIpUtilities::PrepareMethod
  u.prepare_params = ArulsIpUtilities::PrepareParams
  u.prepare_path = ArulsIpUtilities::PreparePath
  u.prepare_query = ArulsIpUtilities::PrepareQuery
  u.result_basic = ArulsIpUtilities::ResultBasic
  u.result_body = ArulsIpUtilities::ResultBody
  u.result_headers = ArulsIpUtilities::ResultHeaders
  u.transform_request = ArulsIpUtilities::TransformRequest
  u.transform_response = ArulsIpUtilities::TransformResponse
}
