# AddressLookupService SDK utility registration
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

AddressLookupServiceUtility.registrar = ->(u) {
  u.clean = AddressLookupServiceUtilities::Clean
  u.done = AddressLookupServiceUtilities::Done
  u.make_error = AddressLookupServiceUtilities::MakeError
  u.feature_add = AddressLookupServiceUtilities::FeatureAdd
  u.feature_hook = AddressLookupServiceUtilities::FeatureHook
  u.feature_init = AddressLookupServiceUtilities::FeatureInit
  u.fetcher = AddressLookupServiceUtilities::Fetcher
  u.make_fetch_def = AddressLookupServiceUtilities::MakeFetchDef
  u.make_context = AddressLookupServiceUtilities::MakeContext
  u.make_options = AddressLookupServiceUtilities::MakeOptions
  u.make_request = AddressLookupServiceUtilities::MakeRequest
  u.make_response = AddressLookupServiceUtilities::MakeResponse
  u.make_result = AddressLookupServiceUtilities::MakeResult
  u.make_point = AddressLookupServiceUtilities::MakePoint
  u.make_spec = AddressLookupServiceUtilities::MakeSpec
  u.make_url = AddressLookupServiceUtilities::MakeUrl
  u.param = AddressLookupServiceUtilities::Param
  u.prepare_auth = AddressLookupServiceUtilities::PrepareAuth
  u.prepare_body = AddressLookupServiceUtilities::PrepareBody
  u.prepare_headers = AddressLookupServiceUtilities::PrepareHeaders
  u.prepare_method = AddressLookupServiceUtilities::PrepareMethod
  u.prepare_params = AddressLookupServiceUtilities::PrepareParams
  u.prepare_path = AddressLookupServiceUtilities::PreparePath
  u.prepare_query = AddressLookupServiceUtilities::PrepareQuery
  u.result_basic = AddressLookupServiceUtilities::ResultBasic
  u.result_body = AddressLookupServiceUtilities::ResultBody
  u.result_headers = AddressLookupServiceUtilities::ResultHeaders
  u.transform_request = AddressLookupServiceUtilities::TransformRequest
  u.transform_response = AddressLookupServiceUtilities::TransformResponse
}
