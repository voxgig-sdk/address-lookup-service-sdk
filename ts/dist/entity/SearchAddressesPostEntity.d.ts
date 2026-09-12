import { AddressLookupServiceEntityBase } from '../AddressLookupServiceEntityBase';
import type { AddressLookupServiceSDK } from '../AddressLookupServiceSDK';
import type { Control } from '../types';
import type { SearchAddressesPost, SearchAddressesPostCreateData } from '../AddressLookupServiceTypes';
declare class SearchAddressesPostEntity extends AddressLookupServiceEntityBase<SearchAddressesPost> {
    constructor(client: AddressLookupServiceSDK, entopts: any);
    make(this: SearchAddressesPostEntity): SearchAddressesPostEntity;
    create(this: any, reqdata?: SearchAddressesPostCreateData, ctrl?: Control): Promise<SearchAddressesPostEntity>;
}
export { SearchAddressesPostEntity };
