<?php
declare(strict_types=1);

// ArulsIp SDK utility: feature_add

class ArulsIpFeatureAdd
{
    public static function call(ArulsIpContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
