-- Enhanced Civil Infrastructure
-- Author: DahakaMVl


-------
-- Bath
-------
UPDATE Districts SET Maintenance=2 WHERE DistrictType='DISTRICT_BATH';
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_BATH', 'YIELD_FOOD', '0', '1', '0');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES ('DISTRICT_BATH', 'YIELD_PRODUCTION', '0', '2', '0');
