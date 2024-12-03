-- begin update discriminator for ExtTask
update WF_CARD set CARD_TYPE = '2000' where CARD_TYPE = '20' ^
-- end update discriminator for ExtTask

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Manager', 'Менеджер', 'Менеджер', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Operator', 'Оператор', 'Оператор', 0, false, '10');


insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'securityDepartment', 'Служба безопасности', 'Служба безопасности', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'legalDepartment', 'Юридический отдел', 'Юридический отдел', 0, false, '10');
^

insert into GARANT_CREDIT_TYPE (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY,
CODE, NAME, COMMENT_)
values (newid(), now(), 'system', 1, now(), null, null, null,
10,'Ипотека', '');

insert into GARANT_CREDIT_TYPE (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY,
CODE, NAME, COMMENT_)
values (newid(), now(), 'system', 1, now(), null, null, null,
20,'Кредит под залог недвижимости', '');

insert into GARANT_CREDIT_TYPE (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY,
CODE, NAME, COMMENT_)
values (newid(), now(), 'system', 1, now(), null, null, null,
30,'Автокредит', '');

insert into GARANT_CREDIT_TYPE (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY,
CODE, NAME, COMMENT_)
values (newid(), now(), 'system', 1, now(), null, null, null,
40,'Потребительские', '');

insert into GARANT_CREDIT_TYPE (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY,
CODE, NAME, COMMENT_)
values (newid(), now(), 'system', 1, now(), null, null, null,
50,'Рефинансирование', '');

insert into GARANT_CREDIT_TYPE (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY,
CODE, NAME, COMMENT_)
values (newid(), now(), 'system', 1, now(), null, null, null,
60,'Реструктуризация', '');
^

insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE)
values (newid(), now(), 'system', 1,
	(select id from wf_proc_role wpr where wpr.code = 'Оператор' ), true, 'garant_OperatorActorStrategy', '10');
^
insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE)
values (newid(), now(), 'system', 1,
	(select id from wf_proc_role wpr where wpr.code = 'Менеджер' ), true, 'garant_ManagerActorStrategy', '10');
^
insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE)
values (newid(), now(), 'system', 1,
	(select id from wf_proc_role wpr where wpr.code = 'Сотрудник Юридического отдела' ), true, 'garant_LegalActorStrategy', '10');
^
insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE)
values (newid(), now(), 'system', 1,
	(select id from wf_proc_role wpr where wpr.code = 'Сотрудник Служба безопасности' ), true, 'garant_SbActorStrategy', '10');
^
update WF_PROC set code='OnlineCreditOrderProcess', card_types =',garant$CreditOrder,', update_ts=now(), updated_by='system'
where name = 'Согласование и выдача кредита'
^
