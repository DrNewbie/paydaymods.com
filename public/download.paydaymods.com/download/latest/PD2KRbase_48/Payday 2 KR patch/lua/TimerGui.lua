CloneClass(TimerGui)

function TimerGui.init(this, unit)
   local res = this.orig.init(this, unit)
   local timer_header_text = managers.localization:text("prop_timer_gui_estimated_time")
   this._gui_script.time_header_text:set_text(timer_header_text)
   return res
end
