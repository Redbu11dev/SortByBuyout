local version = "1.0.0"

--local frame = CreateFrame("Frame")
--frame:SetFrameStrata("LOW")

--local auctionSortButton = CreateFrame("Button","auctionSortButton",_G["AuctionFrame"],"UIPanelButtonTemplate") --frameType, frameName, frameParent, frameTemplate    
--auctionSortButton:SetSize(150,20)
local auctionSortButton = CreateFrame("Button","auctionSortButton",getglobal("AuctionFrame"),"UIPanelButtonTemplate") --frameType, frameName, frameParent, frameTemplate    
auctionSortButton:SetWidth(150)
auctionSortButton:SetHeight(20)
auctionSortButton:SetFrameStrata("HIGH")
--auctionSortButton:SetPoint("CENTER",0,320)
--auctionSortButton:SetPoint("CENTER",40,300)
--auctionSortButton:SetPoint("RIGHT",_G["AuctionFrame"],"TOPRIGHT",-24,0)
--auctionSortButton:SetPoint("TOP",_G["AuctionFrame"],"TOP",0,0)
-- auctionSortButton.text = _G[name.."Text"]
-- auctionSortButton.text:SetText("Hello World")
auctionSortButton:SetText("sort by buyout")
auctionSortButton:SetScript("OnClick", function(self, arg1)
    SortAuctionItems("list", "buyout")
end)
--auctionSortButton:Hide()
--auctionSortButton:Click("foo bar") -- will print "foo bar" in the chat frame.
--auctionSortButton:Click("blah blah") -- will print "blah blah" in the chat frame.

function updateSortByBuyoutButton() 
	if (auctionHouseVisible == true) then
		auctionSortButton:Show()
	else
		auctionSortButton:Hide()
	end
end


function updateAll()
	updateSortByBuyoutButton() 
end

auctionHouseVisible = false
addonIsLoaded = false



--/run print((select(4, GetBuildInfo())));
--/run print(GetBuildInfo());

function SortByBuyout_OnEvent(event)
	--print(string.format("event: %s", event));
	if event == "AUCTION_HOUSE_SHOW" then
		auctionHouseVisible = true
		auctionSortButton:SetPoint("TOPRIGHT",getglobal("AuctionFrame"),"TOPRIGHT",-22,-12)
		updateSortByBuyoutButton()
		--auctionSortButton:Show()
	elseif event == "AUCTION_HOUSE_CLOSED" then
		auctionHouseVisible = false
		--auctionSortButton:Hide()
		updateSortByBuyoutButton()
	end
end

function SortByBuyout_OnLoad()
	print(string.format("%s: v%s by Redbu11 is loaded susscessfully\nThank you for using my addon", "SortByBuyout", version));
	addonIsLoaded = true

	--frame:SetScript("OnEvent", dispatchEvents)
	this:RegisterEvent("ADDON_LOADED")
	
	this:RegisterEvent("AUCTION_HOUSE_SHOW")
	this:RegisterEvent("AUCTION_HOUSE_CLOSED")	
end

--Init
--init()
