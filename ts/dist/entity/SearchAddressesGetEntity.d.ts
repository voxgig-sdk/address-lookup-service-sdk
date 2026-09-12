import { AddressLookupServiceEntityBase } from '../AddressLookupServiceEntityBase';
import type { AddressLookupServiceSDK } from '../AddressLookupServiceSDK';
import type { Control } from '../types';
import type { SearchAddressesGet, SearchAddressesGetListMatch } from '../AddressLookupServiceTypes';
declare class SearchAddressesGetEntity extends AddressLookupServiceEntityBase<SearchAddressesGet> {
    constructor(client: AddressLookupServiceSDK, entopts: any);
    make(this: SearchAddressesGetEntity): SearchAddressesGetEntity;
    list(this: any, reqmatch?: SearchAddressesGetListMatch, ctrl?: Control): Promise<SearchAddressesGetEntity[]>;
}
export { SearchAddressesGetEntity };
