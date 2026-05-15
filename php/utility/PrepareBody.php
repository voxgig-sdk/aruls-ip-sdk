<?php
declare(strict_types=1);

// ArulsIp SDK utility: prepare_body

class ArulsIpPrepareBody
{
    public static function call(ArulsIpContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
