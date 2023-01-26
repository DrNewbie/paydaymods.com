----------------------------------------------------------------------------------
-- 
-- Immediately revert any mode changes made to our tripmines by other players
-- 
----------------------------------------------------------------------------------
local master_UnitNetworkHandler_sync_trip_mine_set_armed = UnitNetworkHandler.sync_trip_mine_set_armed

function UnitNetworkHandler:sync_trip_mine_set_armed(unit, bool, length, sender)
  local we_own_this_tripmine = unit:base()._owner
  local was_armed = unit:base():armed()
  master_UnitNetworkHandler_sync_trip_mine_set_armed(self, unit, bool, length, sender)
  local now_armed = unit:base():armed()
  if we_own_this_tripmine and not was_armed == now_armed then
    unit:base():set_armed(was_armed)
  end
end


-- [Remote / Other / Client] code path
-- UnitNetworkHandler:sync_trip_mine_set_armed(unit, bool, length, sender)
-- -- TripMineBase:sync_trip_mine_set_armed(bool, length)
-- -- -- TripMineBase:_set_armed(armed)


-- [Local / Owner / Host] code path
-- TripMineBase:set_armed
-- -- managers.network:session():send_to_peers_synched("sync_trip_mine_set_armed", self._unit, self._armed, self._length)
-- -- TripMineBase:_set_armed(armed)
