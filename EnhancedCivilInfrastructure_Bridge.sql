-- Enhanced Civil Infrastructure
-- Author: DahakaMVl


------------------------
-- Bridge (if installed)
------------------------
UPDATE Buildings SET PrereqTech='TECH_CONSTRUCTION', Cost=60, Housing=1 WHERE BuildingType='BUILDING_LIME_BRIDGE';

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_LIME_BRIDGE', 'BUILDING_LIME_BRIDGE_TRADE_DOMESTIC_CULTURE');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES ('BUILDING_LIME_BRIDGE_TRADE_DOMESTIC_CULTURE', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_LIME_BRIDGE_TRADE_DOMESTIC_CULTURE', 'Amount', 2);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_LIME_BRIDGE_TRADE_DOMESTIC_CULTURE', 'YieldType', 'YIELD_CULTURE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BUILDING_LIME_BRIDGE_TRADE_DOMESTIC_CULTURE', 'Domestic', 1);
