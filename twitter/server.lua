-- created by vexxy

local twitterHandles = {}

RegisterServerEvent('getTwitterHandle')
AddEventHandler('getTwitterHandle', function(handle)
    local src = source
    if twitterHandles[src] then
        TriggerClientEvent('setTwitterHandle', src, twitterHandles[src])
    end
end)

RegisterServerEvent('setTwitterHandle')
AddEventHandler('setTwitterHandle', function(handle)
    local src = source
    twitterHandles[src] = handle
    TriggerClientEvent('setTwitterHandle', src, handle)
end)

RegisterServerEvent('sendTweet')
AddEventHandler('sendTweet', function(handle, message)
    local src = source
    local name = GetPlayerName(src)
    local tweet = ('[@%s]: %s'):format(handle, message)
    TriggerClientEvent('receiveTweet', -1, tweet)
end)
