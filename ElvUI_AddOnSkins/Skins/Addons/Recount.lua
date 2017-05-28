local E, L, V, P, G = unpack(ElvUI)
local AS = E:GetModule("AddOnSkins")
local S = E:GetModule("Skins")

local function LoadSkin()
	if(not E.private.addOnSkins.Recount) then return end

	local function SkinFrame(frame)
		frame:SetBackdrop(nil)

		local backdrop = CreateFrame("Frame", nil, frame)
		backdrop:SetFrameLevel(frame:GetFrameLevel() - 1)
		backdrop:Point("BOTTOMLEFT", frame, E.PixelMode and 1 or 0, E.PixelMode and 1 or 0)
		backdrop:Point("TOPRIGHT", frame, E.PixelMode and -1 or 0, -(E.PixelMode and 31 or 30))
		backdrop:SetTemplate("Transparent")
		frame.backdrop = backdrop

		local header = CreateFrame("Frame", nil, backdrop)
		header:Height(22)
		header:Point("TOPLEFT", frame, E.PixelMode and 1 or 0, -(E.PixelMode and 8 or 7))
		header:Point("TOPRIGHT", frame, E.PixelMode and -1 or 0, 0)
		header:SetTemplate("Default", true)

		frame.Title:ClearAllPoints()
		frame.Title:SetPoint("LEFT", header, 6, 0)
		frame.Title:FontTemplate()
		frame.Title:SetTextColor(unpack(E.media.rgbvaluecolor))

		frame.CloseButton:ClearAllPoints()
		frame.CloseButton:SetPoint("RIGHT", header, -6, 0)
	end

	local RecountFrames = {
		Recount.MainWindow,
		--Recount.ConfigWindow,
		--Recount.GraphWindow,
		--Recount.DetailWindow
	}

	for _, frame in pairs(RecountFrames) do
		if frame then SkinFrame(frame) end
	end

	local buttons = {
		Recount.MainWindow.CloseButton,
		Recount.MainWindow.RightButton,
		Recount.MainWindow.LeftButton,
		Recount.MainWindow.ResetButton,
		Recount.MainWindow.FileButton,
		Recount.MainWindow.ConfigButton,
		Recount.MainWindow.ReportButton,
		--Recount.ConfigWindow.CloseButton,
		--Recount.GraphWindow.CloseButton,
		--Recount.DetailWindow.CloseButton
	}

	for i = 1, #buttons do
		local button = buttons[i]
		if button then
			AS:Desaturate(button)
		end
	end

	Recount.MainWindow.FileButton:HookScript("OnClick", function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate("Transparent") end end)

	Recount.MainWindow.DragBottomLeft:SetNormalTexture(nil)
	Recount.MainWindow.DragBottomRight:SetNormalTexture(nil)

	S:HandleScrollBar(Recount_MainWindow_ScrollBarScrollBar)

	hooksecurefunc(Recount, "ShowScrollbarElements", function(self, name) Recount_MainWindow_ScrollBarScrollBar:Show() end)
	hooksecurefunc(Recount, "HideScrollbarElements", function(self, name) Recount_MainWindow_ScrollBarScrollBar:Hide() end)

	if Recount.db.profile.MainWindow.ShowScrollbar == false then
		Recount:HideScrollbarElements("Recount_MainWindow_ScrollBar")
	end

	hooksecurefunc(Recount, "ShowReport", function()
		if not Recount_ReportWindow.isSkinned then
			SkinFrame(Recount_ReportWindow)

			S:HandleButton(Recount_ReportWindow.ReportButton)
			S:HandleSliderFrame(Recount_ReportWindow_Slider)

			if Recount_ReportWindow.CloseButton then
				Recount_ReportWindow.CloseButton:GetNormalTexture():SetDesaturated(true)
				Recount_ReportWindow.CloseButton:GetHighlightTexture():SetDesaturated(true)
			end

			Recount_ReportWindow.Whisper:StripTextures()
			S:HandleEditBox(Recount_ReportWindow.Whisper)

			Recount_ReportWindow.isSkinned = true
		end
	end)
end

S:AddCallbackForAddon("Recount", "Recount", LoadSkin)