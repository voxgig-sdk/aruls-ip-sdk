# ProjectName SDK exists test

import pytest
from arulsip_sdk import ArulsIpSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = ArulsIpSDK.test(None, None)
        assert testsdk is not None
