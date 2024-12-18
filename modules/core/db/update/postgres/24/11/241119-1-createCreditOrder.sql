create table GARANT_CREDIT_ORDER (
    ID uuid,
    --
    ADDRESS_CITY varchar(255),
    ADDRESS_HOUSE varchar(255),
    ADDRESS_STREET varchar(255),
    --
    CREDIT_ID uuid,
    CONTRACTOR_ID uuid,
    WORKING_TYPE integer,
    --
    primary key (ID)
);