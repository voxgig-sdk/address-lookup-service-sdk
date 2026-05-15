
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { AddressLookupServiceSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await AddressLookupServiceSDK.test()
    equal(null !== testsdk, true)
  })

})
