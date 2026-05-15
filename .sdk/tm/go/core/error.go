package core

type ArulsIpError struct {
	IsArulsIpError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewArulsIpError(code string, msg string, ctx *Context) *ArulsIpError {
	return &ArulsIpError{
		IsArulsIpError: true,
		Sdk:              "ArulsIp",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *ArulsIpError) Error() string {
	return e.Msg
}
