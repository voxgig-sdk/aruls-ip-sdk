# ArulsIp SDK feature factory

from feature.base_feature import ArulsIpBaseFeature
from feature.test_feature import ArulsIpTestFeature


def _make_feature(name):
    features = {
        "base": lambda: ArulsIpBaseFeature(),
        "test": lambda: ArulsIpTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
