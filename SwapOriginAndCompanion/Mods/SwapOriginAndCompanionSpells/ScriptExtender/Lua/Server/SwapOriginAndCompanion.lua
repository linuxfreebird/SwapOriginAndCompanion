-- Linuxfreebird is the mod author.

-- Thanks to Moxi, Focus, BOZNAZ, and Cerberry for pioneering the code leading up to this development.

-- Special thanks to the following community members that provided their patience, guidiance and mentorship
-- to help me figure out how to write this code from scratch with zero knowledge in mod development, 
-- Lua or BG3SE in a 12 hour developement time: 
-- Aahz, Zehtuka, primal_fire, simosas, ResplendentArrow, JuuM,
-- Chip Chocolate, Legendary Muffin Hippo0o, Satan - ISF Enjoyer, Kilay -  Random Reader,
-- PeachyKee, TechRoo, Cereals, the croc house and anyone else I forgot to mention.

-- I grant permission to anyone who wants to copy, modify and re-release the code.
-- Just please cite the original mod author.

-- The purpose of this function is to allow the player to swap the origin character
-- with a party companion, such that they can exchange dialogue with one another,
-- perform the swap in a convenient and fast way without using console commands,
-- roleplay romance between the alternativing avatars, and who knows what else.
-- The ideal goal is to make this code as stable as possible to not break and important cut scenes
-- or quest lines. I assume approval, romance state, and other important parameters are 
-- preserved between swaps, but further testing is needed to verify.

function SwapOriginAndCompanionLogic(caster, target, spell, _, _, _)
    -- The caster is the origin with the avatar status.
    -- The targer is the companion character you want to swap avatar status with.

    -- We start by promoting the companion to avatar status.

    -- Set companion's faction to the avatar's.
    Osi.SetFaction(target_id,Osi.GetFaction(Osi.DB_Avatars:Get(nil)[1][1]))

    -- Update the Avatar database with the companions ID.
    Osi.DB_Avatars(target_id)

    -- Set the avatar tag on the companion.
    Osi.SetTag(target_id, config.avatar_tag)

    -- Next we depromote the origin to companion status

    -- Set origin faction to companion faction
    Osi.SetFaction(caster_id, config.convert[caster_id])

    -- Remove the origin character as an avatar remembered by the database
    Osi.DB_Avatars:Delete(caster_id)

    -- Remove the avatar tag from the origin character.
    Osi.ClearTag(caster_id,config.avatar_tag)

    -- Make the origin into an npc so we can talk to them with new origin character.
    Osi.MakeNPC(caster_id)

    -- Prevent the new companion from walking back to camp after swapping avatar status occured. 
    -- I don't think is working properly yet.
    Osi.SetFlag("161b7223-039d-4ebe-986f-1dcd9a66733f", caster_id);

    -- We need to add some time delays to the following proc calls, because the game needs 
    -- time to update all stored character parameters

    -- I am not sure why this is here.
    utils.SDelayCall(500,  function() Osi.PROC_GLO_PartyMembers_MakeNPC(caster_id) end)

    -- Add the new companion to the party.
    utils.SDelayCall(500, function() Osi.PROC_GLO_PartyMembers_Add(caster_id, Osi.DB_Avatars:Get(nil)[1][1]) end)
    
    -- I am not sure why we always check if party is full after adding them to the party.
    utils.SDelayCall(500, function() Osi.PROC_CheckPartyFull() end)
end

-- It is not clear to me if other commands are needed to make this script more robust.
-- Additional commands not used in this script are shown below.
    -- PROC_AssignCharacterToPlayer
    -- SDelayCall(500, function() Osi.PROC_Hirelings_AddToParty(caster_id, Osi.DB_Avatars:Get(nil)[1][1]) end)
    -- Osi.RegisterAsCompanion(caster_id, Osi.DB_Avatars:Get(nil)[1][1])
    -- Osi.PROC_CheckFirstTimeRecruited(caster_id)
    -- Osi.SetFlag("ORI_State_Recruited_e78c0aab-fb48-98e9-3ed9-773a0c39988d", caster_id);
    -- Osi.SetNoFollowFlag(caster_id, 0);
    -- Osi.PROC_GLO_PartyMembers_AddHook(caster_id, Osi.DB_Avatars:Get(nil)[1][1]);
    -- DB_Avatars for only player created characters
    -- DB_PartyMembers for everyone in current party