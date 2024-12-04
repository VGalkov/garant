-- begin update discriminator for ExtTask
update WF_CARD set CARD_TYPE = '2000' where CARD_TYPE = '20' ^
-- end update discriminator for ExtTask
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

INSERT INTO public.df_bank (id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", bik, cor_account, bank_region_id, "type", address, short_name, upload_from_cbr, parent_bank_id, iban, bin, license, kbe)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'bank 1', '456343467', NULL, NULL, 'SB', NULL, NULL, false, NULL, NULL, NULL, NULL, NULL);

INSERT INTO public.df_bank (id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", bik, cor_account, bank_region_id, "type", address, short_name, upload_from_cbr, parent_bank_id, iban, bin, license, kbe)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'bank 2', '456121467', NULL, NULL, 'SB', NULL, NULL, false, NULL, NULL, NULL, NULL, NULL);

INSERT INTO public.df_bank (id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", bik, cor_account, bank_region_id, "type", address, short_name, upload_from_cbr, parent_bank_id, iban, bin, license, kbe)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'bank 3', '466764237', NULL, NULL, 'SB', NULL, NULL, false, NULL, NULL, NULL, NULL, NULL);

^

INSERT INTO public.garant_target
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, "name", code)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, 'goal 1', '1');

INSERT INTO public.garant_target
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, "name", code)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, 'goal 2', '2');

INSERT INTO public.garant_target
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, "name", code)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, 'goal 3', '3');
^

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Manager', 'Менеджер', 'Менеджер', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Operator', 'Оператор', 'Оператор', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'securityDepartment', 'СБ', 'СБ', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'legalDepartment', 'Юрист', 'Юрист', 0, false, '10');
^

-----------------------------------------------------------------------------
---   TASK -----------------------

INSERT INTO public.sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, 'Заявка на кредит', NULL, 'tm$Task', NULL, 2, NULL);
^

INSERT INTO public.tm_task_type
(category_id, category_attrs_place, code, description, fields_xml, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, tab_name)
VALUES((select id from sys_category where name ='Заявка на кредит' and (entity_type = 'tm$Task' or entity_type = 'garant$ExtTask') limit 1), 1, '427', 'Заявка на кредит', '', NULL, NULL, 1, NULL, NULL, NULL, NULL, 'Доп. поля');

^

----------------------------------
