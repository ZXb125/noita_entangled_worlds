dofile_once("data/scripts/lib/utilities.lua")

ModLuaFileAppend("data/scripts/perks/map.lua", "mods/quant.ew/files/system/map/append.lua")

util.add_cross_call("ew_place_player_on_map", function()
    for peer_id, data in pairs(ctx.players) do
        local x, y = EntityGetTransform(data.entity)
        y = y - 4
        local _, mx = check_parallel_pos( x )
        local map_x = 0 * 512
        local map_y = 10 * 512

        local mult_x = 512 / 6.0
        local mult_y = 512 / 6.0

        local dx = math.min( math.max( ( map_x - mx ) / mult_x, -420), 420 )
        local dy = math.min( math.max( ( map_y - y ) / mult_y, -240), 240 )
        local pi_x = x - dx * 0.5
        local pi_y = y - dy * 0.5
        GameCreateSpriteForXFrames("data/particles/spatial_map_player.png", pi_x, pi_y, true, 0, 0, 1, true)
    end
end)

return {}