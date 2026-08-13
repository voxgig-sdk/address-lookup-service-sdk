# AddressLookupService SDK utility: make_context

from projectname_sdk.core.context import AddressLookupServiceContext


def make_context_util(ctxmap, basectx):
    return AddressLookupServiceContext(ctxmap, basectx)
