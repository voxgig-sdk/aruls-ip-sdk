# ArulsIp SDK utility: make_context

from arulsip_sdk.core.context import ArulsIpContext


def make_context_util(ctxmap, basectx):
    return ArulsIpContext(ctxmap, basectx)
