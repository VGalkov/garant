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
(newId(), now(), 'system', 1,'Manager', 'Менеджер банка', 'Менеджер банка', 0, false, '10');

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

------------ DOCKKIND ------------
INSERT INTO ts_card_type(id, create_ts, created_by, "name", discriminator, doc_kind_id, doc_template_id, fields_xml)
VALUES(newid(), now(), 'admin', 'garant$CreditOrder', 427, NULL, NULL, '');
^
INSERT INTO sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'Заявка на кредит', NULL, 'garant$CreditOrder', NULL, 1, NULL);
^
INSERT INTO public.df_doc_kind
(category_id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, doc_type_id, code, description, fields_xml, numerator_id, numerator_type, prefix, category_attrs_place, use_all_procs, organization_id, tab_name, create_only_by_template, disable_add_process_actors, portal_publish_allowed, available_to_create_on_mob_cl)
VALUES((select id from SYS_CATEGORY where entity_type='garant$CreditOrder' and name = 'Заявка на кредит' limit 1),
NULL, NULL, 1, NULL, NULL, NULL, NULL, (select id from ts_card_type where discriminator = 427 and name = 'garant$CreditOrder' limit 1), '427', NULL, '', NULL, 1, NULL, 1, true, NULL, NULL, false, false, false, true);
^
update ts_card_type set
doc_kind_id = (select id from SYS_CATEGORY where entity_type='garant$CreditOrder' and name = 'Заявка на кредит' limit 1)
where discriminator = 427 and name = 'garant$CreditOrder'
^
-----------------------------------------




-------------  Менеджер ----------------------
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,group_id, group_names, ip_mask, change_password_at_logon, organization_id, is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'mmm', 'mmm', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'mmm m. m.', 'm', 'mmm', 'm', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,(select id from SEC_GROUP where name ='Руководитель департамента'),NULL, NULL, true, (select id from df_organization where name = 'Наша организация'),false, NULL, NULL, NULL, '10');
^
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'SimpleUser' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'Manager' limit 1),NULL);
--- на таску
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'task_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'task_observer' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'task_controller' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'task_executor' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'task_creator' limit 1),NULL);
------------------------------------------
--- на доку ------------------------------
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'doc_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'doc_endorsement' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'doc_secretary' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'doc_approver' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'doc_acquaintance' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'mmm'),(select id from sec_role  where name = 'doc_publisher' limit 1),NULL);
----------------------------------------------------------------------

---Оператор
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,group_id,group_names, ip_mask, change_password_at_logon,organization_id,is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'ooo', 'ooo', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'ooo o. o.', 'o', 'ooo', 'o', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),NULL, NULL, true,(select id from df_organization where name= 'Наша организация'),false, NULL, NULL, NULL, '10');
---роли
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'SimpleUser' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'Operator' limit 1),NULL);
--- на доки
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'doc_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'doc_endorsement' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'doc_secretary' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'doc_approver' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'doc_acquaintance' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'doc_publisher' limit 1),NULL);
---
--- на таску ---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'task_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'task_observer' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'task_controller' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'task_executor' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ooo'),(select id from sec_role  where name = 'task_creator' limit 1),NULL);
---------------------------------------------------------

---безопасник
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,group_id,group_names, ip_mask, change_password_at_logon,organization_id,is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'sss', 'sss', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'sss s.s.', 's', 's', 's', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),NULL, NULL, true,(select id from df_organization where name= 'Наша организация'),false, NULL, NULL, NULL, '10');
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'SimpleUser' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'securityDepartment' limit 1),NULL);
---
-- doc --
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'task_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'task_observer' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'task_controller' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'task_executor' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'task_creator' limit 1),NULL);
-------------------------
-- task --
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'doc_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'doc_endorsement' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'doc_secretary' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'doc_approver' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'doc_acquaintance' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'sss'),(select id from sec_role  where name = 'doc_publisher' limit 1),NULL);
-------------------------

----------


--- юрист
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,group_id,group_names, ip_mask, change_password_at_logon,organization_id,is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'lll', 'lll', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'lll l.l.', 'l', 'lll', 'l', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),NULL, NULL, true,(select id from df_organization where name= 'Наша организация'),false, NULL, NULL, NULL, '10');
--
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'SimpleUser' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'legalDepartment' limit 1),NULL);
---на доку
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'doc_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'doc_endorsement' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'doc_secretary' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'doc_approver' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'doc_acquaintance' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'doc_publisher' limit 1),NULL);
--- на таску
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'task_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'task_observer' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'task_controller' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'task_executor' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'lll'),(select id from sec_role  where name = 'task_creator' limit 1),NULL);
-------------------------


---пользователь 1
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,group_id,group_names, ip_mask, change_password_at_logon,organization_id,is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'ppp', 'ppp', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'ppp p.p.', 'p', 'p', 'p', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),NULL, NULL, true,(select id from df_organization where name= 'Наша организация'),false, NULL, NULL, NULL, '10');
----
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'SimpleUser' limit 1),NULL);
--на таску
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'task_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'task_observer' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'task_controller' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'task_executor' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'task_creator' limit 1),NULL);
--на доку
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'doc_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'doc_endorsement' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'doc_secretary' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'doc_approver' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'doc_acquaintance' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp'),(select id from sec_role  where name = 'doc_publisher' limit 1),NULL);
-------------------------------------------------------------------------

---пользователь 2
INSERT INTO sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,group_id,group_names, ip_mask, change_password_at_logon,organization_id,is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'ppp2', 'ppp2', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'ppp2 p.p.', 'p2', 'p2', 'p2', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),NULL, NULL, true,(select id from df_organization where name= 'Наша организация'),false, NULL, NULL, NULL, '10');
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'SimpleUser' limit 1),NULL);
----
--на таску
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'task_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'task_observer' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'task_controller' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'task_executor' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'task_creator' limit 1),NULL);
--на доку
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'doc_initiator' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'doc_endorsement' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'doc_secretary' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'doc_approver' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'doc_acquaintance' limit 1),NULL);
---
INSERT INTO sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,user_id,role_id,role_name)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,(select id from sec_user where login = 'ppp2'),(select id from sec_role  where name = 'doc_publisher' limit 1),NULL);
-------------------------------------------------------------------------

insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1, (select id from wf_proc_role wpr where wpr.code = 'Оператор' limit 1), true, 'garant_OperatorActorStrategy', '10');
insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1, (select id from wf_proc_role wpr where wpr.code = 'Менеджер банка' limit 1), true, 'garant_ManagerActorStrategy', '10');
insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1, (select id from wf_proc_role wpr where wpr.code = 'Юрист' limit 1), true, 'garant_LegalActorStrategy', '10');
insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1, (select id from wf_proc_role wpr where wpr.code = 'СБ' limit 1), true, 'garant_SbActorStrategy', '10');
insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1, (select id from wf_proc_role wpr where wpr.code = 'Инициатор' limit 1), true, 'ts_CardAuthorProcessActorStrategy', '10');
^
-- процесс всё равно развёртывать. просто разворачивать в эту строчку.
-- OnlineCreditOrderProcess --

