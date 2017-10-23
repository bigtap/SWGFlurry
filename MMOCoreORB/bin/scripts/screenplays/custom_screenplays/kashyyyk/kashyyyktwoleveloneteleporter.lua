kashyyyktwoleveloneteleporterScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

}

registerScreenPlay("kashyyyktwoleveloneteleporterScreenPlay", true)

function kashyyyktwoleveloneteleporterScreenPlay:start()
	if (isZoneEnabled("kashyyyk")) then
		self:spawnMobiles()
		self:spawnSceneObjects() 
	end
end


function kashyyyktwoleveloneteleporterScreenPlay:spawnSceneObjects()

end

function kashyyyktwoleveloneteleporterScreenPlay:spawnMobiles()

	local pCollector1 = spawnMobile("kashyyyk", "wookteleporter", 120, -459, 179.5, -89.6, -64, 0)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Level 1")
	createObserver(OBJECTRADIALUSED, "kashyyyktwoleveloneteleporterScreenPlay", "teleportKashyyyk", pCollector1)
	if (pCollecter1~= nil) then 
		return
	end
end
function kashyyyktwoleveloneteleporterScreenPlay:teleportKashyyyk(pCollector, pPlayer)--current
	local player = LuaSceneObject(pPlayer)
	player:switchZone("kashyyyk", -463, 157.2, -75.7, 0)
	return 0
end