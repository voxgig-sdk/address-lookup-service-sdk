
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { AddressLookupServiceSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


describe('SearchAddressesGetEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when ADDRESSLOOKUPSERVICE_TEST_LIVE=TRUE.
  afterEach(liveDelay('ADDRESSLOOKUPSERVICE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = AddressLookupServiceSDK.test()
    const ent = testsdk.SearchAddressesGet()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.ADDRESS_LOOKUP_SERVICE_TEST_LIVE
    for (const op of ['list']) {
      if (maybeSkipControl(t, 'entityOp', 'search_addresses_get.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set ADDRESS_LOOKUP_SERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let search_addresses_get_ref01_data = Object.values(setup.data.existing.search_addresses_get)[0] as any

    // LIST
    const search_addresses_get_ref01_ent = client.SearchAddressesGet()
    const search_addresses_get_ref01_match: any = {}

    const search_addresses_get_ref01_list = await search_addresses_get_ref01_ent.list(search_addresses_get_ref01_match)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/search_addresses_get/SearchAddressesGetTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = AddressLookupServiceSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['search_addresses_get01','search_addresses_get02','search_addresses_get03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  const idmapEnvVal = process.env['ADDRESS_LOOKUP_SERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'ADDRESS_LOOKUP_SERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID': idmap,
    'ADDRESS_LOOKUP_SERVICE_TEST_LIVE': 'FALSE',
    'ADDRESS_LOOKUP_SERVICE_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['ADDRESS_LOOKUP_SERVICE_TEST_SEARCH_ADDRESSES_GET_ENTID']

  const live = 'TRUE' === env.ADDRESS_LOOKUP_SERVICE_TEST_LIVE

  if (live) {
    client = new AddressLookupServiceSDK(merge([
      {
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.ADDRESS_LOOKUP_SERVICE_TEST_EXPLAIN,
    live,
    syntheticOnly: live && !idmapOverridden,
    now: Date.now(),
  }

  return setup
}
  
