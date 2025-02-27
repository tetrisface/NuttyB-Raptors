local UnitDefs = UnitDefs or {}
local function a(b, c)
	for d, e in pairs(c) do
		if type(e) == 'table' and type(b[d]) == 'table' then
			a(b[d], e)
		else
			b[d] = e
		end
	end
end
function deepCopy(c, f)
	f = f or {}
	local g = {}
	f[c] = g
	for d, e in pairs(c) do
		if type(e) == 'table' then
			g[d] = f[e] or deepCopy(e, f)
		else
			g[d] = e
		end
	end
	return g
end
function addWeapon(h, i, j)
	UnitDefs[h] = UnitDefs[h] or {}
	UnitDefs[h].weapons = UnitDefs[h].weapons or {}
	UnitDefs[h].weapondefs = UnitDefs[h].weapondefs or {}
	UnitDefs[h].customparams = UnitDefs[h].customparams or {}
	local k = 'repulsor'
	table.insert(
		UnitDefs[h].weapons,
		{
			def = k,
			onlytargetcategory = j or ''
		}
	)
	UnitDefs[h].weapondefs[k] = i
	if i.shield and i.shield.power > 0 then
		i.range = i.shield.radius
		UnitDefs[h].customparams = UnitDefs[h].customparams or {}
		a(
			UnitDefs[h].customparams,
			{
				off_on_stun = 'true',
				shield_color_mult = 0.8,
				shield_power = i.shield.power,
				shield_radius = i.shield.radius
			}
		)
	end
end
local l = {
	avoidfeature = false,
	craterareaofeffect = 0,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.15,
	name = 'PlasmaRepulsor',
	range = 50,
	soundhitwet = 'sizzle',
	weapontype = 'Shield',
	damage = {
		default = 100
	},
	shield = {
		alpha = 0.15,
		armortype = 'shields',
		energyuse = 1,
		force = 2.5,
		intercepttype = 1,
		power = 500,
		powerregen = 3,
		powerregenenergy = 5,
		radius = 50,
		repulser = true,
		smart = true,
		startingpower = 100,
		visiblerepulse = true,
		badcolor = {
			1,
			0.2,
			0.2,
			0.2
		},
		goodcolor = {
			0.2,
			1,
			0.2,
			0.17
		}
	}
}
local m = {
	'armcom',
	'armcomlvl2',
	'armcomlvl3',
	'corcom',
	'corcomlvl2',
	'corcomlvl3',
	'legcom',
	'legcomlvl3',
	'legcomlvl4'
}
for n, h in ipairs(m) do
	local o = deepCopy(l)
	o.shield.alpha = 0.15
	o.shield.power = 500
	o.shield.radius = 100
	o.shield.powerregen = 3
	o.shield.powerregenenergy = 3
	addWeapon(h, o)
end
for p, q in pairs(UnitDefs) do
	if string.sub(p, 1, 24) == 'raptor_air_fighter_basic' then
		if q.weapondefs then
			for r, s in pairs(q.weapondefs) do
				s.name = 'Spike'
				s.accuracy = 200
				s.collidefriendly = 0
				s.collidefeature = 0
				s.avoidfeature = 0
				s.avoidfriendly = 0
				s.areaofeffect = 64
				s.edgeeffectiveness = 0.3
				s.explosiongenerator = 'custom:raptorspike-large-sparks-burn'
				s.cameraShake = {}
				s.dance = {}
				s.interceptedbyshieldtype = 0
				s.model = 'Raptors/spike.s3o'
				s.reloadtime = 1.1
				s.soundstart = 'talonattack'
				s.startvelocity = 200
				s.submissile = 1
				s.smoketrail = 0
				s.smokePeriod = {}
				s.smoketime = {}
				s.smokesize = {}
				s.smokecolor = {}
				s.soundhit = {}
				s.texture1 = {}
				s.texture2 = {}
				s.tolerance = {}
				s.tracks = 0
				s.turnrate = 60000
				s.weaponacceleration = 100
				s.weapontimer = 1
				s.weaponvelocity = 1000
				s.weapontype = {}
				s.wobble = {}
			end
		end
	end
end
if UnitDefs then
	UnitDefs.raptor_air_kamikaze_basic_t2_v1.selfdestructas = 'raptor_empdeath_big'
	UnitDefs.raptor_land_swarmer_emp_t2_v1.weapondefs.raptorparalyzersmall.damage.shields = 60
	UnitDefs.raptor_land_swarmer_emp_t2_v1.weapondefs.raptorparalyzersmall.paralyzetime = 6
	UnitDefs.raptor_land_assault_emp_t2_v1.weapondefs.raptorparalyzerbig.damage.shields = 140
	UnitDefs.raptor_land_assault_emp_t2_v1.weapondefs.raptorparalyzerbig.paralyzetime = 10
	UnitDefs.raptor_allterrain_arty_emp_t2_v1.weapondefs.goolauncher.paralyzetime = 6
	UnitDefs.raptor_allterrain_arty_emp_t4_v1.weapondefs.goolauncher.paralyzetime = 10
	UnitDefs.raptor_air_bomber_emp_t2_v1.cruisealtitude = UnitDefs.raptor_air_bomber_emp_t2_v1.cruisealtitude + 400
	UnitDefs.raptor_air_bomber_emp_t2_v1.weapondefs.weapon.damage.shields = 1000
	UnitDefs.raptor_air_bomber_emp_t2_v1.weapondefs.weapon.damage.default = 2000
	UnitDefs.raptor_air_bomber_emp_t2_v1.weapondefs.weapon.paralyzetime = 10
	UnitDefs.raptor_allterrain_swarmer_emp_t2_v1.weapondefs.raptorparalyzersmall.paralyzetime = 6
	UnitDefs.raptor_allterrain_swarmer_emp_t2_v1.weapondefs.raptorparalyzersmall.damage.shields = 60
	UnitDefs.raptor_allterrain_assault_emp_t2_v1.weapondefs.raptorparalyzerbig.paralyzetime = 6
	UnitDefs.raptor_allterrain_assault_emp_t2_v1.weapondefs.raptorparalyzerbig.damage.shields = 140
	UnitDefs.raptor_matriarch_electric.weapondefs.goo.paralyzetime = 13
	UnitDefs.raptor_matriarch_electric.weapondefs.melee.paralyzetime = 13
	UnitDefs.raptor_matriarch_electric.weapondefs.spike_emp_blob.paralyzetime = 13
	UnitDefs.armcom.featuredefs.dead.reclaimable = false
	UnitDefs.armcom.featuredefs.dead.damage = 57600
	UnitDefs.armcomlvl2.featuredefs.dead.reclaimable = false
	UnitDefs.armcomlvl2.featuredefs.dead.damage = 57600
	UnitDefs.armcomlvl3.featuredefs.dead.reclaimable = false
	UnitDefs.armcomlvl3.featuredefs.dead.damage = 57600
	UnitDefs.corcom.featuredefs.dead.reclaimable = false
	UnitDefs.corcom.featuredefs.dead.damage = 57600
	UnitDefs.corcomlvl2.featuredefs.dead.reclaimable = false
	UnitDefs.corcomlvl2.featuredefs.dead.damage = 57600
	UnitDefs.corcomlvl3.featuredefs.dead.reclaimable = false
	UnitDefs.corcomlvl3.featuredefs.dead.damage = 57600
	UnitDefs.legcom.featuredefs.dead.reclaimable = false
	UnitDefs.legcom.featuredefs.dead.damage = 57600
	UnitDefs.legcomlvl2.featuredefs.dead.reclaimable = false
	UnitDefs.legcomlvl2.featuredefs.dead.damage = 57600
	UnitDefs.legcomlvl3.featuredefs.dead.reclaimable = false
	UnitDefs.legcomlvl3.featuredefs.dead.damage = 57600
	UnitDefs.legcomlvl4.featuredefs.dead.reclaimable = false
	UnitDefs.legcomlvl4.featuredefs.dead.damage = 57600
end
local t = {
	'raptor_antinuke',
	'raptor_turret_acid_t2_v1',
	'raptor_turret_acid_t3_v1',
	'raptor_turret_acid_t4_v1',
	'raptor_turret_antiair_t2_v1',
	'raptor_turret_antiair_t3_v1',
	'raptor_turret_antiair_t4_v1',
	'raptor_turret_antinuke_t2_v1',
	'raptor_turret_antinuke_t3_v1',
	'raptor_turret_basic_t2_v1',
	'raptor_turret_basic_t3_v1',
	'raptor_turret_basic_t4_v1',
	'raptor_turret_burrow_t2_v1',
	'raptor_turret_emp_t2_v1',
	'raptor_turret_emp_t3_v1',
	'raptor_turret_emp_t4_v1',
	'raptor_worm_green'
}
for p, u in pairs(UnitDefs) do
	for r, v in ipairs(t) do
		if p == v then
			u.maxthisunit = 10
			u.health = u.health * 2
			if u.weapondefs then
				for r, s in pairs(u.weapondefs) do
					s.reloadtime = s.reloadtime / 1.5
					s.range = s.range / 2
				end
			end
			break
		end
	end
end
for w, q in pairs(UnitDefs) do
	if q.builder == true then
		if q.canfly == true then
			q.explodeas = ''
			q.selfdestructas = ''
		end
	end
end
local t = {
	'raptor_air_bomber_basic_t2_v1',
	'raptor_air_bomber_basic_t2_v2',
	'raptor_air_bomber_basic_t4_v1',
	'raptor_air_bomber_basic_t4_v2',
	'raptor_air_bomber_basic_t1_v1'
}
for p, u in pairs(UnitDefs) do
	for r, v in ipairs(t) do
		if p == v then
			if u.weapondefs then
				for r, s in pairs(u.weapondefs) do
					s.damage.default = s.damage.default / 1.33
				end
			end
			break
		end
	end
end
