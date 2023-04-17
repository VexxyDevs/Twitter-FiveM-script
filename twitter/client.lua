-- created by vexxy


local twitterHandle = ''

RegisterCommand('twitterhandle', function(source, args)
    local handle = table.concat(args, ' ')
    if handle ~= '' then
        TriggerServerEvent('setTwitterHandle', handle)
        twitterHandle = handle
        TriggerEvent('chat:addMessage', {
            color = {0, 0, 255},
            multiline = true,
            args = {'[Twitter]', 'Your Twitter handle has been set to: ' .. handle}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {0, 0, 255},
            multiline = true,
            args = {'[Twitter]', 'Usage: /twitterhandle [handle]'}
        })
    end
end, false)

RegisterCommand('twtyy', function(source, args)
    local message = table.concat(args, ' ')
    if message ~= '' then
        TriggerServerEvent('sendTweet', twitterHandle, message)
    else
        TriggerEvent('chat:addMessage', {
            color = {0, 0, 255},
            multiline = true,
            args = {'[Twitter]', 'Usage: /twtyy [message]'}
        })
    end
end, false)

RegisterNetEvent('setTwitterHandle')
AddEventHandler('setTwitterHandle', function(handle)
    twitterHandle = handle
    local playerId = PlayerId()
    SetPlayerNameTagText(playerId, ('[Twitter] | %s | %s'):format(handle, GetPlayerName(playerId)))
end)

RegisterNetEvent('receiveTweet')
AddEventHandler('receiveTweet', function(handle, message)
    local name = ('[Twitter] | %s'):format(handle)
    TriggerEvent('chat:addMessage', {
        color = {0, 0, 255},
        multiline = true,
        args = {name, message}
    })
end)
