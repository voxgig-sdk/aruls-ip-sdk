<?php
declare(strict_types=1);

// ArulsIp SDK utility: result_body

class ArulsIpResultBody
{
    public static function call(ArulsIpContext $ctx): ?ArulsIpResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
