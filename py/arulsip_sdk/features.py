# ArulsIp SDK feature factory

from arulsip_sdk.feature.base_feature import ArulsIpBaseFeature
from arulsip_sdk.feature.test_feature import ArulsIpTestFeature


def _make_feature(name):
    features = {
        "base": lambda: ArulsIpBaseFeature(),
        "test": lambda: ArulsIpTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
