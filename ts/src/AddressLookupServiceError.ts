
import { Context } from './Context'


class AddressLookupServiceError extends Error {

  isAddressLookupServiceError = true

  sdk = 'AddressLookupService'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  AddressLookupServiceError
}

