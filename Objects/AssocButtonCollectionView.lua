Inherit = 'ScrollView'
UpdateDrawBlacklist = {['NeedsItemUpdate']=true}

Items = false
NeedsItemUpdate = false
TextColour = colours.black
BackgroundColour = colours.white

OnDraw = function(self, x, y)
		if self.NeedsItemUpdate then
			self:UpdateItems()
			self.NeedsItemUpdate = false
		end
		Drawing.DrawBlankArea(x, y, self.Width, self.Height, self.BackgroundColour)
end

UpdateItems = function(self, value)
		self:RemoveAllObjects()

		local x = 1
		local y = 1

		for i, assocButton in ipairs(self.Items) do

			self:AddObject({
			X=x,
			Y=y,
			Height = x,
			Type = 'AssocButton',
			AssocButton = assocButton
			})

		y = y + AssocButton.Height

		end
	self:UpdateScroll()
end

OnUpdate = function(self, value)
	if value == 'Items' then
		self.NeedsItemUpdate = true
	end
end