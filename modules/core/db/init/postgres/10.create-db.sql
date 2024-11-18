-- begin GARANT_CREDIT
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
    BANK_ID uuid,
    DATE_ date,
    SUM double precision,
    TARGET_ID uuid not null,
    --
    primary key (ID)
)^
-- end GARANT_CREDIT
-- begin GARANT_CREDIT_TYPE
create table GARANT_CREDIT_TYPE (
    ID uuid,
    VERSION integer,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    CODE varchar(255),
    NAME varchar(255),
    COMMENT_ text,
    --
    primary key (ID)
)^
-- end GARANT_CREDIT_TYPE
-- begin GARANT_CREDIT_ORDER
create table GARANT_CREDIT_ORDER (
    ID uuid,
    VERSION integer,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    ADDRESS_CITY varchar(255),
    ADDRESS_HOUSE varchar(255),
    ADDRESS_STREET varchar(255),
    --
    CREDIT_ID uuid,
    LOADER_ID uuid,
    WORKING_TYPE integer,
    --
    primary key (ID)
)^
-- end GARANT_CREDIT_ORDER
-- begin GARANT_TARGET
create table GARANT_TARGET (
    ID uuid,
    VERSION integer,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255),
    CODE varchar(255),
    --
    primary key (ID)
)^
-- end GARANT_TARGET
