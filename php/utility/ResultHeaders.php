<?php
declare(strict_types=1);

// ArulsIp SDK utility: result_headers

class ArulsIpResultHeaders
{
    public static function call(ArulsIpContext $ctx): ?ArulsIpResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
