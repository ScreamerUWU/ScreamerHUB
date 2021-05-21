local Raw = getrawmetatable(game);

local Index = Raw.__index;
local NameCall = Raw.__namecall;

local Closure = newcclosure or read_me or function(Func) return Func end

setreadonly(Raw,false)

Raw.__index = Closure(function(self, Indexed)
    
	if _G.Invisible then 
		if Indexed == "HumanoidRootPart" then
			return Index(self, "UpperTorso")
		end
	end
	
	return Index(self,Indexed)
end)

Raw.__namecall = Closure(function(self, ...)
    
    local Args = {...}
    local Meth = getnamecallmethod()
    
    if Meth == ("FindFirstChild") and Args[1] == ("RealHumanoidRootPart") then
       Args[1]  = ("HumanoidRootPart")
       return NameCall(self, ...)
    end
    
    return NameCall(self, ...)
end)

setreadonly(Raw,true)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(Character)
    _G.Invisible = false
end)
