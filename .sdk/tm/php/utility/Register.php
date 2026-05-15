<?php
declare(strict_types=1);

// AddressLookupService SDK utility registration

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

AddressLookupServiceUtility::setRegistrar(function (AddressLookupServiceUtility $u): void {
    $u->clean = [AddressLookupServiceClean::class, 'call'];
    $u->done = [AddressLookupServiceDone::class, 'call'];
    $u->make_error = [AddressLookupServiceMakeError::class, 'call'];
    $u->feature_add = [AddressLookupServiceFeatureAdd::class, 'call'];
    $u->feature_hook = [AddressLookupServiceFeatureHook::class, 'call'];
    $u->feature_init = [AddressLookupServiceFeatureInit::class, 'call'];
    $u->fetcher = [AddressLookupServiceFetcher::class, 'call'];
    $u->make_fetch_def = [AddressLookupServiceMakeFetchDef::class, 'call'];
    $u->make_context = [AddressLookupServiceMakeContext::class, 'call'];
    $u->make_options = [AddressLookupServiceMakeOptions::class, 'call'];
    $u->make_request = [AddressLookupServiceMakeRequest::class, 'call'];
    $u->make_response = [AddressLookupServiceMakeResponse::class, 'call'];
    $u->make_result = [AddressLookupServiceMakeResult::class, 'call'];
    $u->make_point = [AddressLookupServiceMakePoint::class, 'call'];
    $u->make_spec = [AddressLookupServiceMakeSpec::class, 'call'];
    $u->make_url = [AddressLookupServiceMakeUrl::class, 'call'];
    $u->param = [AddressLookupServiceParam::class, 'call'];
    $u->prepare_auth = [AddressLookupServicePrepareAuth::class, 'call'];
    $u->prepare_body = [AddressLookupServicePrepareBody::class, 'call'];
    $u->prepare_headers = [AddressLookupServicePrepareHeaders::class, 'call'];
    $u->prepare_method = [AddressLookupServicePrepareMethod::class, 'call'];
    $u->prepare_params = [AddressLookupServicePrepareParams::class, 'call'];
    $u->prepare_path = [AddressLookupServicePreparePath::class, 'call'];
    $u->prepare_query = [AddressLookupServicePrepareQuery::class, 'call'];
    $u->result_basic = [AddressLookupServiceResultBasic::class, 'call'];
    $u->result_body = [AddressLookupServiceResultBody::class, 'call'];
    $u->result_headers = [AddressLookupServiceResultHeaders::class, 'call'];
    $u->transform_request = [AddressLookupServiceTransformRequest::class, 'call'];
    $u->transform_response = [AddressLookupServiceTransformResponse::class, 'call'];
});
