package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewIpAddressEntityFunc func(client *ArulsIpSDK, entopts map[string]any) ArulsIpEntity

var NewIpnEntityFunc func(client *ArulsIpSDK, entopts map[string]any) ArulsIpEntity

