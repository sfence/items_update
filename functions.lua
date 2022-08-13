
function items_update.fix_stack_alias(stack)
  local count = stack:get_count()
  if (count>0) then
    local def = stack:get_definition()
    local name = stack:get_name()
    if def and (def.name~=name) then
      local meta = stack:get_meta():to_table()
      local wear = stack:get_wear()
      stack:set_name(def.name)
      stack:set_count(count)
      stack:get_meta():from_table(meta)
      stack:set_wear(wear)
      if (stack:get_count()~=count) then
        error("[items_update] Fatal error: stack update failed for item "..name)
        return false
      end
      return true
    end
  end
  
  return false
end

