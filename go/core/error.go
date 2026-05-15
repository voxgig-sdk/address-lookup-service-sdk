package core

type AddressLookupServiceError struct {
	IsAddressLookupServiceError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewAddressLookupServiceError(code string, msg string, ctx *Context) *AddressLookupServiceError {
	return &AddressLookupServiceError{
		IsAddressLookupServiceError: true,
		Sdk:              "AddressLookupService",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *AddressLookupServiceError) Error() string {
	return e.Msg
}
