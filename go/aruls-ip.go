package voxgigarulsipsdk

import (
	"github.com/voxgig-sdk/aruls-ip-sdk/core"
	"github.com/voxgig-sdk/aruls-ip-sdk/entity"
	"github.com/voxgig-sdk/aruls-ip-sdk/feature"
	_ "github.com/voxgig-sdk/aruls-ip-sdk/utility"
)

// Type aliases preserve external API.
type ArulsIpSDK = core.ArulsIpSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type ArulsIpEntity = core.ArulsIpEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type ArulsIpError = core.ArulsIpError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewIpAddressEntityFunc = func(client *core.ArulsIpSDK, entopts map[string]any) core.ArulsIpEntity {
		return entity.NewIpAddressEntity(client, entopts)
	}
	core.NewIpnEntityFunc = func(client *core.ArulsIpSDK, entopts map[string]any) core.ArulsIpEntity {
		return entity.NewIpnEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewArulsIpSDK = core.NewArulsIpSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
