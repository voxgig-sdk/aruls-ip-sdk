import { IpAddressEntity } from './entity/IpAddressEntity';
import { IpnEntity } from './entity/IpnEntity';
export type * from './ArulsIpTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { ArulsIpEntityBase } from './ArulsIpEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class ArulsIpSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    IpAddress(entopts?: Record<string, any>): IpAddressEntity;
    Ipn(entopts?: Record<string, any>): IpnEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): ArulsIpSDK;
    tester(testopts?: any, sdkopts?: any): ArulsIpSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof ArulsIpSDK;
export { stdutil, config, BaseFeature, ArulsIpEntityBase, ArulsIpSDK, SDK, };
