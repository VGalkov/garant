alter table GARANT_CREDIT_ORDER rename column contractor_id to contractor_id__u75014 ;
alter table GARANT_CREDIT_ORDER drop constraint FK_GARANT_CREDIT_ORDER_ON_CONTRACTOR ;
drop index IDX_GARANT_CREDIT_ORDER_ON_CONTRACTOR ;
