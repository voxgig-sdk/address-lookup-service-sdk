# AddressLookupService SDK feature factory

from addresslookupservice_sdk.feature.base_feature import AddressLookupServiceBaseFeature
from addresslookupservice_sdk.feature.test_feature import AddressLookupServiceTestFeature


def _make_feature(name):
    features = {
        "base": lambda: AddressLookupServiceBaseFeature(),
        "test": lambda: AddressLookupServiceTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
