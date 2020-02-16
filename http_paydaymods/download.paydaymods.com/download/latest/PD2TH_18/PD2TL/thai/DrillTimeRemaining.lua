TimerGui.old_init = TimerGui.old_init or TimerGui.init
function TimerGui:init(unit)
   local res = self:old_init(unit)
   local timer_header_text = managers.localization:text("prop_timer_gui_estimated_time")
   self._gui_script.time_header_text:set_text(timer_header_text)
   return res
end