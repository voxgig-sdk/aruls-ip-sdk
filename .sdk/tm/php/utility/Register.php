<?php
declare(strict_types=1);

// ArulsIp SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

ArulsIpUtility::setRegistrar(function (ArulsIpUtility $u): void {
    $u->clean = [ArulsIpClean::class, 'call'];
    $u->done = [ArulsIpDone::class, 'call'];
    $u->make_error = [ArulsIpMakeError::class, 'call'];
    $u->feature_add = [ArulsIpFeatureAdd::class, 'call'];
    $u->feature_hook = [ArulsIpFeatureHook::class, 'call'];
    $u->feature_init = [ArulsIpFeatureInit::class, 'call'];
    $u->fetcher = [ArulsIpFetcher::class, 'call'];
    $u->make_fetch_def = [ArulsIpMakeFetchDef::class, 'call'];
    $u->make_context = [ArulsIpMakeContext::class, 'call'];
    $u->make_options = [ArulsIpMakeOptions::class, 'call'];
    $u->make_request = [ArulsIpMakeRequest::class, 'call'];
    $u->make_response = [ArulsIpMakeResponse::class, 'call'];
    $u->make_result = [ArulsIpMakeResult::class, 'call'];
    $u->make_point = [ArulsIpMakePoint::class, 'call'];
    $u->make_spec = [ArulsIpMakeSpec::class, 'call'];
    $u->make_url = [ArulsIpMakeUrl::class, 'call'];
    $u->param = [ArulsIpParam::class, 'call'];
    $u->prepare_auth = [ArulsIpPrepareAuth::class, 'call'];
    $u->prepare_body = [ArulsIpPrepareBody::class, 'call'];
    $u->prepare_headers = [ArulsIpPrepareHeaders::class, 'call'];
    $u->prepare_method = [ArulsIpPrepareMethod::class, 'call'];
    $u->prepare_params = [ArulsIpPrepareParams::class, 'call'];
    $u->prepare_path = [ArulsIpPreparePath::class, 'call'];
    $u->prepare_query = [ArulsIpPrepareQuery::class, 'call'];
    $u->result_basic = [ArulsIpResultBasic::class, 'call'];
    $u->result_body = [ArulsIpResultBody::class, 'call'];
    $u->result_headers = [ArulsIpResultHeaders::class, 'call'];
    $u->transform_request = [ArulsIpTransformRequest::class, 'call'];
    $u->transform_response = [ArulsIpTransformResponse::class, 'call'];
});
