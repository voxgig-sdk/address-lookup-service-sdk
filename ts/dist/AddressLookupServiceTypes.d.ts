export interface SearchAddressesGet {
    Address?: Record<string, any>;
    ValidationInformation?: Record<string, any>;
}
export interface SearchAddressesGetListMatch {
    n?: number;
    q: string;
}
export interface SearchAddressesPost {
    SuggestedAddress?: any[];
    n?: number;
    q: string;
}
export interface SearchAddressesPostCreateData {
    SuggestedAddress?: any[];
    n?: number;
    q: string;
}
