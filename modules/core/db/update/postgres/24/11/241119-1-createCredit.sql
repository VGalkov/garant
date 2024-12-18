create table GARANT_CREDIT (
    ID uuid,
    VERSION integer,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    CREDIT_TYPE_ID uuid not null,
    MANAGER_ID uuid,
    BANK_ID uuid,
    DATE_ date,
    SUM double precision,
    TARGET_ID uuid not null,
    --
    primary key (ID)
);