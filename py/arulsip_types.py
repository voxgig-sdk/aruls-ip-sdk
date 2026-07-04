# Typed models for the ArulsIp SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class IpAddress:
    ip: str


@dataclass
class IpAddressLoadMatch:
    ip: Optional[str] = None


@dataclass
class Ipn:
    pass


@dataclass
class IpnLoadMatch:
    pass

