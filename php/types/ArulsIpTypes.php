<?php
declare(strict_types=1);

// Typed models for the ArulsIp SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** IpAddress entity data model. */
class IpAddress
{
    public string $ip;
}

/** Request payload for IpAddress#load. */
class IpAddressLoadMatch
{
    public ?string $ip = null;
}

/** Ipn entity data model. */
class Ipn
{
}

/** Request payload for Ipn#load. */
class IpnLoadMatch
{
}

