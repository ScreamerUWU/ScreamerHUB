local function ItemCount(ITEM)

   local Found = 0

   for I, V in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
      if V.Name == (ITEM) then
         Found = (Found + 1)
      end
   end
   
   return Found
end

local function AutoCount()
   for i = 1,#_G.ItemCounter do
   
      local Count = ItemCount(_G.ItemCounter[i].ItemName)
    
      _G.ItemCounter[i].Amount = (Count)
      _G.ItemCounter[i].TextObject.Text = (_G.ItemCounter[i].ItemName .. ": " .. tostring(Count))
   end
end

AutoCount()
