local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

local function LoadSkin()
	local captureBarCreate = function(i)
		local bar = _G["WorldStateCaptureBar"..i]
		local leftBar = _G["WorldStateCaptureBar"..i.."LeftBar"]
		local rightBar = _G["WorldStateCaptureBar"..i.."RightBar"]
		local middleBar = _G["WorldStateCaptureBar"..i.."MiddleBar"]
		local indicator = _G["WorldStateCaptureBar"..i.."Indicator"]

		bar:StripTextures()
		bar:CreateBackdrop()
		bar:Size(173, 16)

		bar.leftIcon = bar:CreateTexture("$parentLeftIcon", "ARTWORK")
		bar.leftIcon:SetTexture(E.AddonSkinsMedia.Textures.Alliance)
		bar.leftIcon:Point("RIGHT", bar, "LEFT", 0, 0)
		bar.leftIcon:Size(32)

		bar.rightIcon = bar:CreateTexture("$parentRightIcon", "ARTWORK")
		bar.rightIcon:SetTexture(E.AddonSkinsMedia.Textures.Horde)
		bar.rightIcon:Point("LEFT", bar, "RIGHT", -4, 0)
		bar.rightIcon:Size(32)

		bar.spark = CreateFrame("Frame", "$parentSpark", bar)
		bar.spark:SetTemplate("Default", true)
		bar.spark:Size(4, 18)

		leftBar:Size(85, 16)
		leftBar:Point("LEFT", 0, 0)
		leftBar:SetTexture(E.media.glossTex)
		leftBar:SetTexCoord(1, 0, 1, 0)
		leftBar:SetVertexColor(0, 0.44, 0.87)

		rightBar:Size(85, 16)
		rightBar:Point("RIGHT", 0, 0)
		rightBar:SetTexture(E.media.glossTex)
		rightBar:SetTexCoord(1, 0, 1, 0)
		rightBar:SetVertexColor(0.77, 0.12, 0.23)

		middleBar:Size(25, 16)
		middleBar:SetTexture(E.media.glossTex)
		middleBar:SetTexCoord(1, 0, 1, 0)
		middleBar:SetVertexColor(1, 1, 1)

		indicator:StripTextures()
	end

	local captureBarUpdate = function(i, value, neutralPercent)
		local bar = _G["WorldStateCaptureBar"..i]
		local position = 173 * (1 - value / 100)
		local barSize = 170

		if not bar.oldValue then
			bar.oldValue = position
		end

		local middleBar = _G["WorldStateCaptureBar"..i.."MiddleBar"]
		if neutralPercent == 0 then
			middleBar:SetWidth(1)
		else
			middleBar:SetWidth(neutralPercent / 100 * barSize)
		end
		bar.oldValue = position

		if bar.spark then
			bar.spark:SetPoint("CENTER", "WorldStateCaptureBar"..i, "LEFT", position, 0)
		else
			captureBarCreate(i)
		end
	end

	hooksecurefunc(ExtendedUI.CAPTUREPOINT, "create", captureBarCreate)
	hooksecurefunc(ExtendedUI.CAPTUREPOINT, "update", captureBarUpdate)
end

S:AddCallback("WorldStateFrame", LoadSkin)