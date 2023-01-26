local orig_PlayerSound_say = PlayerSound.say

function PlayerSound:say(sound_name, sync, important_say)

    local ret = orig_PlayerSound_say(self, sound_name, sync, true)

    if not important_say then
        self._speaking = nil
    end
    return ret
end
