<?php
declare(strict_types=1);

// ArulsIp SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class ArulsIpMakeContext
{
    public static function call(array $ctxmap, ?ArulsIpContext $basectx): ArulsIpContext
    {
        return new ArulsIpContext($ctxmap, $basectx);
    }
}
