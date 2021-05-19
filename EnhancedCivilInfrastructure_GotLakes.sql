-- Enhanced Civil Infrastructure
-- Author: DahakaMVl


---------
-- Canals
---------
-- Revert workaround when using Got Lakes
UPDATE Terrains SET Hills=1 WHERE TerrainType IN ('TERRAIN_GRASS_HILLS', 'TERRAIN_PLAINS_HILLS', 'TERRAIN_TUNDRA_HILLS', 'TERRAIN_SNOW_HILLS', 'TERRAIN_DESERT_HILLS');