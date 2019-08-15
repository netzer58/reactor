Inherit = 'View'

Width = 50
Height = 1
AssocButton = nil

OnLoad = function(self)
local program = self.Bedrock

--reactor click event
function reactorClick(self, event,side,x,y)
program.Timers = {}
program.reactorIndex = self.Index
program:LoadView('reactor')
end
--turbine click event
function turbineClick(self, event,side,x,y)
program.Timers = {}
program.turbineIndex = self.Index
program:LoadView('turbine')
end
		self:AddObject({
			X=2,
			Y=1,
			Type='Label',
			Width=12,
			Height=1,
			Name='reactorLabel',
			Text='Reactor ',
			Visible=false
		})

		self:AddObject({
			X=14,
			Y=1,
			Width=6,
			Height=1,
			Type='Button',
			Text='Status',
			Name='reactorButton',
			Visible=false,
			BackgroundColour = "red",
			OnClick = reactorClick
		})

		self:AddObject({
			X=28,
			Y=1,
			Height=1,
			Type='Label',
			Width=12,
			Height=1,
			Name='turbineLabel',
			Text='Turbine ',
			Visible=false
		})

		self:AddObject({
			X=40,
			Y=1,
			Height=1,
			Width=6,
			Type='Button',
			Text='Status',
			Name='turbineButton',
			Visible=false,
			BackgroundColour = "red",
			OnClick = turbineClick
		})

		self:OnUpdate('AssocButton')
end

function dumpvar(data)
    -- cache of tables already printed, to avoid infinite recursive loops
    local tablecache = {}
    local buffer = ""
    local padder = "    "
 
    local function _dumpvar(d, depth)
        local t = type(d)
        local str = tostring(d)
        if (t == "table") then
            if (tablecache[str]) then
                -- table already dumped before, so we dont
                -- dump it again, just mention it
                buffer = buffer.."<"..str..">\n"
            else
                tablecache[str] = (tablecache[str] or 0) + 1
                buffer = buffer.."("..str..") {\n"
                for k, v in pairs(d) do
                    buffer = buffer..string.rep(padder, depth+1).."["..k.."] => "
                    _dumpvar(v, depth+1)
                end
                buffer = buffer..string.rep(padder, depth).."}\n"
            end
        elseif (t == "number") then
            buffer = buffer.."("..t..") "..str.."\n"
        else
            buffer = buffer.."("..t..") \""..str.."\"\n"
        end
    end
    _dumpvar(data, 0)
    return buffer
end

OnUpdate = function(self, value)
		if value == 'AssocButton' then
			--check for nil values
			if self.AssocButton.objIndex ~= nil then
				self:GetObject('reactorButton').Index = self.AssocButton.objIndex
				self:GetObject('reactorLabel').Text = 'Reactor '..self.AssocButton.objIndex
				self:GetObject('turbineButton').Index = self.AssocButton.objIndex
				self:GetObject('turbineLabel').Text = 'Turbine '..self.AssocButton.objIndex
			end
			--check if reactor has nil values
				if self.AssocButton.reactorVisible ~= nil then
				self:GetObject('reactorLabel').Visible = self.AssocButton.reactorVisible
				self:GetObject('reactorButton').Visible = self.AssocButton.reactorVisible
					if self.AssocButton.reactorOnline == true then
						self:GetObject('reactorButton').BackgroundColour = "green"
					else
						self:GetObject('reactorButton').BackgroundColour = "red"
					end
				end
			-- check if turbine has nil values
			if self.AssocButton.turbineVisible ~= nil then
				self:GetObject('turbineLabel').Visible = self.AssocButton.turbineVisible
				self:GetObject('turbineButton').Visible = self.AssocButton.turbineVisible
					if self.AssocButton.turbineOnline == true then
						self:GetObject('turbineButton').BackgroundColour = "green"
					else
						self:GetObject('turbineButton').BackgroundColour = "red"
					end
			end
		end
end