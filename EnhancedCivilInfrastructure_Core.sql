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
UPDATE Districts SET PrereqTech='TECH_ENGINEERING', Cost=55, Housing=1 WHERE DistrictType='DISTRICT_CANAL';

-- Workaround to enable Canals on Hills
UPDATE Terrains SET Hills=0 WHERE TerrainType IN ('TERRAIN_GRASS_HILLS', 'TERRAIN_PLAINS_HILLS', 'TERRAIN_TUNDRA_HILLS', 'TERRAIN_SNOW_HILLS', 'TERRAIN_DESERT_HILLS');

INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_GRASS_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_PLAINS_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_TUNDRA_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_SNOW_HILLS');
INSERT OR IGNORE INTO District_ValidTerrains (DistrictType, TerrainType) VALUES ('DISTRICT_CANAL', 'TERRAIN_DESERT_HILLS');

INSERT OR IGNORE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_CANAL', 'YIELD_GOLD', 2, 0, 2);
INSERT OR IGNORE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_CANAL', 'YIELD_FOOD', 0, 2, 0);

INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_COMMERCIAL_HUB', 'Canal_Gold');
INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_HARBOR', 'Canal_Gold');

INSERT OR IGNORE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES ('Canal_Gold', 'LOC_DISTRICT_CANAL_GOLD', 'YIELD_GOLD', 2, 1, 'DISTRICT_CANAL');


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


------------------
-- Mountain Tunnel
------------------
UPDATE Improvements SET PrereqTech='TECH_MILITARY_SCIENCE' WHERE ImprovementType='IMPROVEMENT_MOUNTAIN_TUNNEL'