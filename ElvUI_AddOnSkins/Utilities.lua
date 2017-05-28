local E, L, V, P, G = unpack(ElvUI)
local AS = E:GetModule("AddOnSkins")
local S = E:GetModule("Skins")

local select = select
local pairs = pairs

local EnumerateFrames = EnumerateFrames

function AS:FindChildFrameByPoint(parent, objType, point1, relativeTo, point2, x, y)
	if not parent then return end

	local frame, childID
	local childPoint1, childParent, childPoint2, childX, childY
	local childs = {parent:GetChildren()}

	x = E:Round(x)
	y = E:Round(y)

	for id, child in pairs(childs) do
		if not child:GetName() then
			if not objType or (objType and child:IsObjectType(objType)) then
				childPoint1, childParent, childPoint2, childX, childY = child:GetPoint()
				childX = childX and E:Round(childX) or 0
				childY = childY and E:Round(childY) or 0

				if childPoint1 == point1
				and childParent == relativeTo
				and (not point2 or (childPoint2 == point2))
				and x == childX
				and y == childY
				then
					frame, childID = child, id
					break
				end
			end
		end
	end

	return frame, childID
end

function AS:FindChildFrameBySize(parent, objType, width, height)
	if not parent then return end

	local frame, childID
	local childs = {parent:GetChildren()}

	width = E:Round(width)
	height = E:Round(height)

	for id, child in pairs(childs) do
		if not child:GetName() then
			if not objType or (objType and child:IsObjectType(objType)) then
				if E:Round(child:GetWidth()) == width and E:Round(child:GetHeight()) == width then
					frame, childID = child, id
					break
				end
			end
		end
	end

	return frame, childID
end

function AS:FindFrameBySizeChild(childTypes, width, height)
	if not childTypes then return end

	local frame
	local obj = EnumerateFrames()

	width = E:Round(width)
	height = E:Round(height)

	while obj do
		if obj.IsObjectType and obj:IsObjectType("Frame") then
			if not (obj:GetName() and obj:GetParent()) then
				if E:Round(obj:GetWidth()) == width and E:Round(obj:GetHeight()) == height then
					local childs = {}
					for _, child in pairs({obj:GetChildren()}) do
						childs[#childs + 1] = child:GetObjectType()
					end

					local matched = 0
					for _, cType in pairs(childTypes) do
						for _, type in pairs(childs) do
							if cType == type then
								matched = matched + 1
							end
						end
					end

					if matched == #childTypes then
						frame = obj
						break
					end
				end
			end
		end

		obj = EnumerateFrames(obj)
	end

	return frame
end

function AS:FindFrameByPoint(point1, relativeTo, point2, x, y, multipleFrames)
	if not relativeTo then return end

	local frame
	if multipleFrames then
		frame = {}
	end

	local childPoint1, childParent, childPoint2, childX, childY
	local obj = EnumerateFrames()

	x = E:Round(x)
	y = E:Round(y)

	while obj do
		if obj.IsObjectType and obj:IsObjectType("Frame") then
			if not (obj:GetName() and obj:GetParent()) then
				childPoint1, childParent, childPoint2, childX, childY = obj:GetPoint()
				childX = childX and E:Round(childX) or 0
				childY = childY and E:Round(childY) or 0

				if childPoint1 == point1
				and childParent == relativeTo
				and (not point2 or (childPoint2 == point2))
				and x == childX
				and y == childY
				then
					if multipleFrames then
						frame[#frame + 1] = obj
					else
						frame = obj
						break
					end
				end
			end
		end

		obj = EnumerateFrames(obj)
	end

	return frame
end

function AS:Desaturate(frame, point)
	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:IsObjectType("Texture") then
			local Texture = region:GetTexture()
			if type(Texture) == "string" and strlower(Texture) == "interface\\dialogframe\\ui-dialogbox-corner" then
				region:SetTexture(nil)
				region:Kill()
			else
				region:SetDesaturated(true)
			end
		end
	end

	frame:HookScript("OnUpdate", function(self)
		if self:GetNormalTexture() then
			self:GetNormalTexture():SetDesaturated(true)
		end
		if self:GetPushedTexture() then
			self:GetPushedTexture():SetDesaturated(true)
		end
		if self:GetHighlightTexture() then
			self:GetHighlightTexture():SetDesaturated(true)
		end
	end)
end

function AS:AcceptFrame(MainText, Function)
	if not AcceptFrame then
		AcceptFrame = CreateFrame("Frame", "AcceptFrame", UIParent)
		AcceptFrame:SetTemplate("Transparent")
		AcceptFrame:Point("CENTER", UIParent, "CENTER")
		AcceptFrame:SetFrameStrata("DIALOG")

		AcceptFrame.Text = AcceptFrame:CreateFontString(nil, "OVERLAY")
		AcceptFrame.Text:FontTemplate()
		AcceptFrame.Text:Point("TOP", AcceptFrame, "TOP", 0, -10)

		AcceptFrame.Accept = CreateFrame("Button", nil, AcceptFrame, "OptionsButtonTemplate")
		S:HandleButton(AcceptFrame.Accept)
		AcceptFrame.Accept:Size(70, 25)
		AcceptFrame.Accept:Point("RIGHT", AcceptFrame, "BOTTOM", -10, 20)
		AcceptFrame.Accept:SetFormattedText("|cFFFFFFFF%s|r", YES)

		AcceptFrame.Close = CreateFrame("Button", nil, AcceptFrame, "OptionsButtonTemplate")
		S:HandleButton(AcceptFrame.Close)
		AcceptFrame.Close:Size(70, 25)
		AcceptFrame.Close:Point("LEFT", AcceptFrame, "BOTTOM", 10, 20)
		AcceptFrame.Close:SetScript("OnClick", function(self) self:GetParent():Hide() end)
		AcceptFrame.Close:SetFormattedText("|cFFFFFFFF%s|r", NO)
	end
	AcceptFrame.Text:SetText(MainText)
	AcceptFrame:Size(AcceptFrame.Text:GetStringWidth() + 100, AcceptFrame.Text:GetStringHeight() + 60)
	AcceptFrame.Accept:SetScript("OnClick", Function)
	AcceptFrame:Show()
end