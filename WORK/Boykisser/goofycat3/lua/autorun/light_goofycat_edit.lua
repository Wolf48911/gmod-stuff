player_manager.AddValidModel("Goofy Cat V2", "models/lightshoro_workshop/goofycat/boykisser_v2.mdl");
player_manager.AddValidHands("Goofy Cat V2", "models/lightshoro_workshop/goofycat/boykisser_c_v2.mdl", 0, "00000000");

player_manager.AddValidModel("Goofy Cat V2 Outlined", "models/lightshoro_workshop/goofycat/boykisser_v2o.mdl");
player_manager.AddValidHands("Goofy Cat V2 Outlined", "models/lightshoro_workshop/goofycat/boykisser_c_v2o.mdl", 0, "00000000");

hook.Remove("PostPlayerDraw", "Goofy Cat Eradium Add 2")

hook.Add("PostPlayerDraw", "Goofy Cat Eradium Add 2", function(ply)
    if IsValid(ply) and (ply:GetModel() == "models/lightshoro_workshop/goofycat/boykisser_v2.mdl" or ply:GetModel() == "models/lightshoro_workshop/goofycat/boykisser_v2o.mdl"  ) then
        
        local skin = ply:GetSkin()

        -- get the list of all flexes names and ids and print them
    

        if skin == 0 then
            ply:SetFlexWeight(ply:GetFlexIDByName("YouLikeKissingBoys"), 0)
            ply:SetFlexWeight(ply:GetFlexIDByName("Scare_002"), 0)
        end

        if skin == 1 then
            ply:SetFlexWeight(ply:GetFlexIDByName("YouLikeKissingBoys"), 0)
            ply:SetFlexWeight(ply:GetFlexIDByName("Scare_002"), 1)
        end

        if skin == 2 then
            ply:SetFlexWeight(ply:GetFlexIDByName("YouLikeKissingBoys"), 1)
            ply:SetFlexWeight(ply:GetFlexIDByName("Scare_002"), 0)
        end
    end
end)

hook.Remove("PreDrawPlayerHands", "Goofy Cat Eradium Hands")

hook.Add("PreDrawPlayerHands", "Goofy Cat Eradium Hands", function(hands, vm, ply, wpn)
    if IsValid(hands) and hands:GetModel() == "models/lightshoro_workshop/goofycat/boykisser_c_v2.mdl" or hands:GetModel() == "models/lightshoro_workshop/goofycat/boykisser_c_v2o.mdl" then
        hands:SetSkin(ply:GetSkin())

        
        local handClawGroup = 1
        local modelClawGroup = ply:GetBodygroup(4)

        local handWarmerGroup = 2
        local modelWarmerGroup = ply:GetBodygroup(8)

        local handHoodieGroup = 3
        local modelHoodieGroup = ply:GetBodygroup(9)

        if modelClawGroup == 1 then
            hands:SetBodygroup(handClawGroup, 1)
        else 
            hands:SetBodygroup(handClawGroup, 0)
        end
        

        if modelWarmerGroup == 1 then
            hands:SetBodygroup(handWarmerGroup, 1)
        else 
            hands:SetBodygroup(handWarmerGroup, 0)
        end

        if modelHoodieGroup == 1 then
            hands:SetBodygroup(handHoodieGroup, 1)
            ply:SetBodygroup(1, 1)
        else 
            hands:SetBodygroup(handHoodieGroup, 0)
            ply:SetBodygroup(1, 0)
        end

    end
end)