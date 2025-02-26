--T3 Eco
local unitDefs = UnitDefs or {}
local t3AfusName = 'lootboxplatinum'
local t3ConvName = 'armdf'
local t3NanoName = 'lootboxnano'
local t3EnergyDef = {
	buildpic = 'other/resourcecheat.dds',
	buildtime = 1000000,
	energycost = 500000,
	energymake = 30000,
	energystorage = 90000,
	explodeas = 'korgExplosionSelfd',
	health = 10000,
	metalcost = 97000,
	metalmake = 0,
	reclaimable = true,
	canmove = false
}
local t3ConverterDef = {
	activatewhenbuilt = true,
	buildpic = 'lootboxes/LOOTBOXGOLD.DDS',
	buildtime = 313000,
	energycost = 500000,
	energymake = 0,
	explodeas = 'fusionExplosion',
	health = 1000,
	metalcost = 8000,
	objectname = 'Units/CORUWFUS.s3o',
	script = 'Units/CORUWFUS.cob',
	selfdestructas = 'fusionExplosionSelfd'
}
local t3NanoDef = {}
local converterCustomparams = {
	energyconv_capacity = 5000,
	energyconv_efficiency = 0.0181,
	decoyfor = nil,
	i18n_en_humanname = 'Super Energy Converter',
	i18n_en_tooltip = 'Converts 5000 energy into 125 metal per sec',
	subfolder = 'ArmBuildings/LandEconomy',
	techlevel = 3,
	unitgroup = 'metal'
}
local converterFeaturedefsDead = {
	blocking = true,
	category = 'corpses',
	collisionvolumeoffsets = '1.8653717041 -0.0807505981445 0.994560241699',
	collisionvolumescales = '89.9762878418 27.3368988037 72.5986480713',
	collisionvolumetype = 'Box',
	damage = 3210,
	featuredead = 'HEAP',
	footprintx = 5,
	footprintz = 5,
	height = 20,
	metal = 3099,
	object = 'Units/coruwfus_dead.s3o',
	reclaimable = true
}
local converterFeaturedefsHeap = {
	blocking = false,
	category = 'heaps',
	damage = 1605,
	footprintx = 5,
	footprintz = 5,
	height = 4,
	metal = 1240,
	object = 'Units/cor5X5A.s3o',
	reclaimable = true,
	resurrectable = 0
}

local builderNames = {
	'armaca',
	'armack',
	'armacv',
	'coraca',
	'corack',
	'coracv',
	'legaca',
	'legack',
	'legacv'
}

for key, value in pairs(t3EnergyDef) do
	unitDefs[t3AfusName][key] = value
end

unitDefs[t3AfusName].customparams.i18n_en_humanname = 'Super Fusion Reactor'
unitDefs[t3AfusName].customparams.i18n_en_tooltip = 'Produces 30000 Energy, Transportable (Very Hazardous)'
unitDefs[t3AfusName].customparams.techlevel = 3

for key, value in pairs(t3ConverterDef) do
	unitDefs[t3ConvName][key] = value
end

for key, value in pairs(converterCustomparams) do
	unitDefs[t3ConvName].customparams[key] = value
end

for key, value in pairs(converterFeaturedefsDead) do
	unitDefs[t3ConvName].featuredefs.dead[key] = value
end
for key, value in pairs(converterFeaturedefsHeap) do
	unitDefs[t3ConvName].featuredefs.heap[key] = value
end

for key, value in pairs(t3NanoDef) do
	unitDefs[t3NanoName][key] = value
end

unitDefs[t3NanoName].customParams.i18n_en_humanname = 'Super Nano'
unitDefs[t3NanoName].customParams.i18n_en_tooltip = 'Builds a lot'
unitDefs[t3NanoName].customParams.techlevel = 3
unitDefs[t3NanoName].customParams.subfolder = 'ArmBuildings/LandUtil'
unitDefs[t3NanoName].customParams.unitgroup = 'builder'

for i = 1, #builderNames do
	local builderName = builderNames[i]
	local nBuildOptions = #unitDefs[builderName].buildoptions
	unitDefs[builderName].buildoptions[nBuildOptions + 1] = t3ConvName
	unitDefs[builderName].buildoptions[nBuildOptions + 2] = t3AfusName
	unitDefs[builderName].buildoptions[nBuildOptions + 3] = t3NanoName
end
