Debug = ESX.GetConfig().EnableDebug
local zxLib = exports.zx_lib:GetZXLib()
local isShowing = false
---@param message string
---@param typ string
local function TextUI(message, typ)
    isShowing = true
    zxLib.TextUI({text = message})
end

local function HideUI()
    if not isShowing then
        return
    end
    isShowing = false
    zxLib.HideTextUI()
end

exports("TextUI", TextUI)
exports("HideUI", HideUI)
ESX.SecureNetEvent("ESX:TextUI", TextUI)
ESX.SecureNetEvent("ESX:HideUI", HideUI)

if Debug then
    RegisterCommand("textui:error", function()
        ESX.TextUI("i ~r~love~s~ donuts", "error")
    end, false)

    RegisterCommand("textui:success", function()
        ESX.TextUI("i ~g~love~s~ donuts", "success")
    end, false)

    RegisterCommand("textui:info", function()
        ESX.TextUI("i ~b~love~s~ donuts", "info")
    end, false)

    RegisterCommand("textui:hide", function()
        ESX.HideUI()
    end, false)
end
