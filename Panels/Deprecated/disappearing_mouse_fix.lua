function fixMouseCursor()
	-- Your method code here
	for i=0,panel:getNumModulators()-1 do

		m = panel:getModulatorByIndex(i)
		
		if m ~= nil then
			c = m:getComponent()

			if c ~= nil then
				c:setProperty("componentMouseCursor", 2,false)
			end

		end
	end
end