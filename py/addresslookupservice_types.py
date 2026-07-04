# Typed models for the AddressLookupService SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class SearchAddressesGet:
    address: Optional[dict] = None
    validation_information: Optional[dict] = None


@dataclass
class SearchAddressesGetListMatch:
    address: Optional[dict] = None
    validation_information: Optional[dict] = None


@dataclass
class SearchAddressesPost:
    q: str
    n: Optional[int] = None
    suggested_address: Optional[list] = None


@dataclass
class SearchAddressesPostCreateData:
    n: Optional[int] = None
    q: Optional[str] = None
    suggested_address: Optional[list] = None

