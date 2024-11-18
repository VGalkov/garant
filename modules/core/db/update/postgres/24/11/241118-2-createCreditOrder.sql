alter table GARANT_CREDIT_ORDER add constraint FK_GARANT_CREDIT_ORDER_ON_CREDIT foreign key (CREDIT_ID) references GARANT_CREDIT(ID);
alter table GARANT_CREDIT_ORDER add constraint FK_GARANT_CREDIT_ORDER_ON_LOADER foreign key (LOADER_ID) references DF_INDIVIDUAL(CONTRACTOR_ID);
alter table GARANT_CREDIT_ORDER add constraint FK_GARANT_CREDIT_ORDER_ON_ID foreign key (ID) references WF_CARD(ID) on delete CASCADE;
create index IDX_GARANT_CREDIT_ORDER_ON_CREDIT on GARANT_CREDIT_ORDER (CREDIT_ID);
create index IDX_GARANT_CREDIT_ORDER_ON_LOADER on GARANT_CREDIT_ORDER (LOADER_ID);
