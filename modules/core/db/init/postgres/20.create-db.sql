-- begin GARANT_TARGET
create unique index IDX_GARANT_TARGET_UK_NAME on GARANT_TARGET (NAME) where DELETE_TS is null ^
create unique index IDX_GARANT_TARGET_UK_CODE on GARANT_TARGET (CODE) where DELETE_TS is null ^
-- end GARANT_TARGET
