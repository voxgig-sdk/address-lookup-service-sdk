# SearchAddressesGet entity test

require "minitest/autorun"
require "json"
require_relative "../AddressLookupService_sdk"
require_relative "runner"

class SearchAddressesGetEntityTest < Minitest::Test
  def test_create_instance
    testsdk = AddressLookupServiceSDK.test(nil, nil)
    ent = testsdk.SearchAddressesGet(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = search_addresses_get_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["list"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "search_addresses_get." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set ADDRESSLOOKUPSERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    search_addresses_get_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.search_addresses_get")))
    search_addresses_get_ref01_data = nil
    if search_addresses_get_ref01_data_raw.length > 0
      search_addresses_get_ref01_data = Helpers.to_map(search_addresses_get_ref01_data_raw[0][1])
    end

    # LIST
    search_addresses_get_ref01_ent = client.SearchAddressesGet(nil)
    search_addresses_get_ref01_match = {}

    search_addresses_get_ref01_list_result = search_addresses_get_ref01_ent.list(search_addresses_get_ref01_match, nil)
    assert search_addresses_get_ref01_list_result.is_a?(Array)

  end
end

def search_addresses_get_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "search_addresses_get", "SearchAddressesGetTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = AddressLookupServiceSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["search_addresses_get01", "search_addresses_get02", "search_addresses_get03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["ADDRESSLOOKUPSERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "ADDRESSLOOKUPSERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID" => idmap,
    "ADDRESSLOOKUPSERVICE_TEST_LIVE" => "FALSE",
    "ADDRESSLOOKUPSERVICE_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["ADDRESSLOOKUPSERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["ADDRESSLOOKUPSERVICE_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = AddressLookupServiceSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["ADDRESSLOOKUPSERVICE_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["ADDRESSLOOKUPSERVICE_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
