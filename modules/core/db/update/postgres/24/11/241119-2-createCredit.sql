alter table GARANT_CREDIT add constraint FK_GARANT_CREDIT_ON_CREDIT_TYPE foreign key (CREDIT_TYPE_ID) references GARANT_CREDIT_TYPE(ID);
alter table GARANT_CREDIT add constraint FK_GARANT_CREDIT_ON_MANAGER foreign key (MANAGER_ID) references SEC_USER(ID);
alter table GARANT_CREDIT add constraint FK_GARANT_CREDIT_ON_BANK foreign key (BANK_ID) references DF_BANK(ID);
alter table GARANT_CREDIT add constraint FK_GARANT_CREDIT_ON_TARGET foreign key (TARGET_ID) references GARANT_TARGET(ID);
create index IDX_GARANT_CREDIT_ON_CREDIT_TYPE on GARANT_CREDIT (CREDIT_TYPE_ID);
create index IDX_GARANT_CREDIT_ON_MANAGER on GARANT_CREDIT (MANAGER_ID);
create index IDX_GARANT_CREDIT_ON_BANK on GARANT_CREDIT (BANK_ID);
create index IDX_GARANT_CREDIT_ON_TARGET on GARANT_CREDIT (TARGET_ID);