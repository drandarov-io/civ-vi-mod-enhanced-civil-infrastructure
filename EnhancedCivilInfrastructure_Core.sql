-- Enhanced Civil Infrastructure
-- Author: DahakaMVl

--------------------
-- Military Engineer
--------------------
UPDATE Units SET BaseMoves=3, BuildCharges=3 WHERE UnitType='UNIT_MILITARY_ENGINEER';


--------
-- Roads
--------
UPDATE Routes SET MovementCost=0.65, SupportsBridges=1 WHERE RouteType='ROUTE_ANCIENT_ROAD';
UPDATE Routes SET MovementCost=0.5 WHERE RouteType='ROUTE_MEDIEVAL_ROAD';
UPDATE Routes SET MovementCost=0.35 WHERE RouteType='ROUTE_INDUSTRIAL_ROAD';
UPDATE Routes SET MovementCost=0.25 WHERE RouteType='ROUTE_MODERN_ROAD';
UPDATE Routes SET MovementCost=0.125 WHERE RouteType='ROUTE_RAILROAD';


--------
-- Canal
--------
UPDATE Districts SET PrereqTech='TECH_ENGINEERING', Cost=60, Housing=1, Maintenance=3 WHERE DistrictType='DISTRICT_CANAL';

-- Workaround to enable Canals on Hills
UPDATE Terrains SET Hills=0 WHERE TerrainType IN ('TERRAIN_GRASS_HILLS', 'TERRAIN_PLAINS_HILLS', 'TERRAIN_TUNDRA_HILLS', 'TERRAIN_SNOW_HILLS', 'TERRAIN_DESERT_HILLS');

INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_GRASS_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_PLAINS_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_TUNDRA_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_SNOW_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_DESERT_HILLS');

INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_CANAL', 'YIELD_GOLD', 2, 0, 2);
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_CANAL', 'YIELD_FOOD', 0, 2, 0);
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_CANAL', 'YIELD_PRODUCTION', 0, 1, 0);

INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_COMMERCIAL_HUB', 'Canal_Gold');
INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_SUGUBA', 'Canal_Gold');
INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_HARBOR', 'Canal_Gold');
INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_ROYAL_NAVY_DOCKYARD', 'Canal_Gold');
INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_COTHON', 'Canal_Gold');

INSERT OR IGNORE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES ('Canal_Gold', 'LOC_DISTRICT_CANAL_GOLD', 'YIELD_GOLD', 2, 1, 'DISTRICT_CANAL');

------
-- Dam
------
UPDATE Districts SET Maintenance=3 WHERE DistrictType='DISTRICT_DAM';
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_DAM', 'YIELD_FOOD', '0', '1', '0');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_DAM', 'YIELD_PRODUCTION', '0', '2', '0');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_DAM', 'YIELD_CULTURE', '0', '1', '1');


-----------
-- Aqueduct
-----------
UPDATE Districts SET Maintenance=2 WHERE DistrictType='DISTRICT_AQUEDUCT';
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_AQUEDUCT', 'YIELD_FOOD', '0', '1', '0');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_AQUEDUCT', 'YIELD_PRODUCTION', '0', '2', '0');


---------------
-- Panama Canal
---------------
UPDATE Buildings SET MaxWorldInstances=-1 WHERE BuildingType='BUILDING_PANAMA_CANAL';
UPDATE Building_YieldChanges SET YieldChange=20 WHERE BuildingType='BUILDING_PANAMA_CANAL';

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_PANAMA_CANAL', 'BUILDING_PANAMA_CANAL_TRADE_DOMESTIC_PRODUCTION');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES ('BUILDING_PANAMA_CANAL_TRADE_DOMESTIC_PRODUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_PANAMA_CANAL_TRADE_DOMESTIC_PRODUCTION', 'Amount', 4);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_PANAMA_CANAL_TRADE_DOMESTIC_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_PANAMA_CANAL_TRADE_DOMESTIC_PRODUCTION', 'Domestic', 1);

-- Suez canal easter egg (I'm too stupid right now)
-- INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_PLAYER_HAS_SOCIAL_MEDIA', 'REQUIREMENT_PLAYER_HAS_CIVIC');
-- INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_PLAYER_HAS_SOCIAL_MEDIA', 'CivicType', 'CIVIC_SOCIAL_MEDIA');
-- INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('PLAYER_HAS_CIVIC_SOCIAL_MEDIA', 'REQUIREMENTSET_TEST_ANY');
-- INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('PLAYER_HAS_CIVIC_SOCIAL_MEDIA', 'REQUIRES_PLAYER_HAS_SOCIAL_MEDIA');
--
-- INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_PANAMA_CANAL', 'BUILDING_PANAMA_CANAL_SOCIAL_MEDIA_CULTURE');
-- INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('BUILDING_PANAMA_CANAL_SOCIAL_MEDIA_CULTURE', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',  'PLAYER_HAS_CIVIC_SOCIAL_MEDIA');
-- INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_PANAMA_CANAL_SOCIAL_MEDIA_CULTURE', 'Amount', 10);
-- INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_PANAMA_CANAL_SOCIAL_MEDIA_CULTURE', 'YieldType', 'YIELD_CULTURE');


------------------
-- Mountain Tunnel
------------------
UPDATE Improvements SET PrereqTech='TECH_MILITARY_SCIENCE' WHERE ImprovementType='IMPROVEMENT_MOUNTAIN_TUNNEL'