--Code by SentyTek Corporation. This debugger is exclusively for SentyTek Corporation. Do not reuse.--

local STDebugger = {}

---@Section throwScreen
---A function used to display error text, in HTML error format.
---@param x number The x position of the text.
---@param y number The y position of the text.
---@param errorCode number The error code. Supports HTML 400-500 errors.
---@param errorText string Optional diplay text. Will revert to HTML error text if not provided.
---@return nil
function STDebugger.throwScreen(lll, x, y, errorCode, errorText)
    errorText = errorText or ""
    errorCodeFirst = string.sub(errorCode, 1,1)
    if errorText == "" then
        if errorCodeFirst == '4' then
            if errorCode == 400 then
                errorText = "Bad Request"
            elseif errorCode == 401 then 
                errorText = "Unauthorized"
            elseif errorCode == 403 then
                errorText = "Forbidden"
            elseif errorCode == 404 then
                errorText = "Not Found"
            elseif errorCode == 405 then
                errorText = "Illegal Method"
            elseif errorCode == 406 then
                errorText = "Not Acceptable"
            elseif errorCode == 407 then
                errorText = "Proxy Auth Needed"
            elseif errorCode == 408 then
                errorText = "Request Timeout"
            elseif errorCode == 415 then
                errorText = "Unsupported Media Type"
            elseif errorCode == 418 then
                errorText = "I'm a teapot"
            elseif errorCode == 429 then
                errorText = "Too Many Requests"
            elseif errorCode == 451 then
                errorText = "Unavailable For Legal Reasons"
            end
        elseif errorCodeFirst == '5' then
            if errorCode == 500 then
                errorText = "Internal Server Error"
            elseif errorCode == 501 then
                errorText = "Not Implemented"
            elseif errorCode == 502 then
                errorText = "Bad Gateway"
            elseif errorCode == 503 then
                errorText = "Service Unavailable"
            elseif errorCode == 504 then
                errorText = "Gateway Timeout"
            elseif errorCode == 507 then
                errorText = "Insufficient Storage"
            elseif errorCode == 508 then
                errorText = "Loop Detected"
            end
        else 
            errorText = "Unknown Error"
        end
    end

    screen.drawText(x,y, tostring(errorCode) .. ": " .. errorText)
end
---@endsection

---@section throw
---A function used to throw errors via composite channel 32. Ex: threshold gate so if anything not 0 is on 32, turn on a light
---@param errorCode number The error code. Supports HTML 400-500 errors.
---@return nil
function STDebugger.throw(kkkkk, errorCode)
    output.setNumber(32, errorCode)
end
---@endsection

---@section cout
---A joke. Used best when local std = require("STDebugger") is used.
---@param text string The text to output.
---@return return number Always return 0.
function STDebugger.cout(text)
    text = text or ""
    output.setNumber(32, 5)
    return 0
end
---@endsection

return STDebugger