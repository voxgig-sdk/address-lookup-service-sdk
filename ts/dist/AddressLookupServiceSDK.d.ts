import { SearchAddressesGetEntity } from './entity/SearchAddressesGetEntity';
import { SearchAddressesPostEntity } from './entity/SearchAddressesPostEntity';
export type * from './AddressLookupServiceTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { AddressLookupServiceEntityBase } from './AddressLookupServiceEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class AddressLookupServiceSDK {
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
    SearchAddressesGet(entopts?: Record<string, any>): SearchAddressesGetEntity;
    SearchAddressesPost(entopts?: Record<string, any>): SearchAddressesPostEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): AddressLookupServiceSDK;
    tester(testopts?: any, sdkopts?: any): AddressLookupServiceSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof AddressLookupServiceSDK;
export { stdutil, config, BaseFeature, AddressLookupServiceEntityBase, AddressLookupServiceSDK, SDK, };
