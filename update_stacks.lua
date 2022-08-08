
if minetest.settings:get_bool("items_update_move_stack", true) then
  minetest.register_on_player_inventory_action(
      function (player, action, inv, inv_info)
        if (action=="move") then
          --print(dump(inv_info))
          local stack = inv:get_stack(inv_info.to_list, inv_info.to_index)
          if items_update.fix_stack_alias(stack) then
            inv:set_stack(inv_info.to_list, inv_info.to_index, stack)
          end
        elseif (action=="put") then
          --print(dump(inv_info))
          local stack = inv:get_stack(inv_info.listname, inv_info.index)
          if items_update.fix_stack_alias(stack) then
            inv:set_stack(inv_info.listname, inv_info.index, stack)
          end
        end
      end
    )
end

if minetest.settings:get_bool("items_update_onjoin_stacks", false) then
  minetest.register_on_joinplayer(
      function(player)
        local inv = player:get_inventory()
        for listname,_ in pairs(inv:get_lists()) do
          local size = inv:get_size(listname)
          for index = 1,size do
            
            local stack = inv:get_stack(listname, index)
            if items_update.fix_stack_alias(stack) then
              inv:set_stack(listname, index, stack)
            end
          end
        end
      end
    )
end

