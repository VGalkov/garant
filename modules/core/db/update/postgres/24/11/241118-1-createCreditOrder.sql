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
);