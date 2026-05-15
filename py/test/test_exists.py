# ProjectName SDK exists test

import pytest
from addresslookupservice_sdk import AddressLookupServiceSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = AddressLookupServiceSDK.test(None, None)
        assert testsdk is not None
