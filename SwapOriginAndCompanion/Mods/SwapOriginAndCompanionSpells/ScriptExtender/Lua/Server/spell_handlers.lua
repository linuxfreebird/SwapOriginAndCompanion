-- spell_handlers.lua
-- Handling spell-related functionality for the mod

--config = Ext.Require("Server/config.lua")
--utils = Ext.Require("Server/utils.lua")

--Ext.Require("Server/config.lua")
--Ext.Require("Server/utils.lua")


function TryAddSpell(actor, spellName)
    if  Osi.HasSpell(actor, "SwapOriginAndCompanionMainSpell") == 0 then
        Osi.AddSpell(actor, "SwapOriginAndCompanionMainSpell")
    end
end

function handleUsingSpellOnTarget(caster, target, spell, _, _, _)
    if spell == "SwapOriginAndCompanionMainSpell" then
 
        caster_id = config.convert[Osi.GetUUID(caster)]
        target_id = config.convert[Osi.GetUUID(target)]
        avatar_id = config.convert[Osi.GetUUID(Osi.DB_Avatars:Get(nil)[1][1])]
        -- Force caster to only make changes if he is the avatar to prevent accidental removal of
        -- the last avatar in the party.  Caster is prevented from self-targeting.
        if Osi.IsTagged(caster, config.avatar_tag) and caster ~= target then
            SwapOriginAndCompanionLogic(caster, target, spell, _, _, _)
        end
    end
end


function onSessionLoaded()
    Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(levelName, _)
        if levelName ~= "EPI_Main_A" then
            local party = Osi.DB_PartyMembers:Get(nil)
            for i = #party, 1, -1 do
                TryAddSpell(party[i][1], "SwapOriginAndCompanionMainSpell")
            end
        end
    end)
    
    Ext.Osiris.RegisterListener("CharacterJoinedParty", 1, "after", function(actor)
        TryAddSpell(actor, "SwapOriginAndCompanionMainSpell")
    end)
    
    Ext.Osiris.RegisterListener("UsingSpellOnTarget", 6, "after", function(caster, target, spell, _, _, _)
        handleUsingSpellOnTarget(caster, target, spell, _, _, _)
    end)
end

return {
    onSessionLoaded = onSessionLoaded
}

