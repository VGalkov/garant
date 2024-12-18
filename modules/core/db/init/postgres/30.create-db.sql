--- Напишите Groovy скрипт обновления базы данных для создания значений справочника
--- "Вид кредита" из строки: "Ипотека,Кредит под залог недвижимости, Автокредит,
--- Потребительские,Рефинансирование, Реструктуризация"
--- написан не goovie скрипт, а запросы, которые на таком уровне связей пока проще дебагать в запросах

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
---


-- банки
INSERT INTO public.df_bank (id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", bik, cor_account, bank_region_id, "type", address, short_name, upload_from_cbr, parent_bank_id, iban, bin, license, kbe)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'bank 1', '456343467', NULL, NULL, 'SB', NULL, NULL, false, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO public.df_bank (id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", bik, cor_account, bank_region_id, "type", address, short_name, upload_from_cbr, parent_bank_id, iban, bin, license, kbe)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'bank 2', '456121467', NULL, NULL, 'SB', NULL, NULL, false, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO public.df_bank (id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", bik, cor_account, bank_region_id, "type", address, short_name, upload_from_cbr, parent_bank_id, iban, bin, license, kbe)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'bank 3', '466764237', NULL, NULL, 'SB', NULL, NULL, false, NULL, NULL, NULL, NULL, NULL);
^
--- цели кредита
INSERT INTO garant_target
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, "name", code)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, 'цель 1', '1');
^
INSERT INTO garant_target
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, "name", code)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, 'цель 2', '2');

INSERT INTO garant_target
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, "name", code)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, 'цель 3', '3');
^
---

------------ DOCKKIND ------------
INSERT INTO ts_card_type(id, create_ts, created_by, "name", discriminator, doc_kind_id, doc_template_id, fields_xml)
VALUES(newid(), now(), 'admin', 'garant$CreditOrder', 427, NULL, NULL, '');
^
INSERT INTO sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'Заявка на кредит', NULL, 'garant$CreditOrder', NULL, 1, NULL);
^
INSERT INTO df_doc_kind
(category_id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, doc_type_id, code, description, fields_xml, numerator_id, numerator_type, prefix, category_attrs_place, use_all_procs, organization_id, tab_name, create_only_by_template, disable_add_process_actors, portal_publish_allowed, available_to_create_on_mob_cl)
VALUES((select id from SYS_CATEGORY where entity_type='garant$CreditOrder' and name = 'Заявка на кредит' limit 1),
NULL, NULL, 1, NULL, NULL, NULL, NULL, (select id from ts_card_type where discriminator = 427 and name = 'garant$CreditOrder' limit 1), '427', NULL, '', NULL, 1, NULL, 1, true, NULL, NULL, false, false, false, true);
^
update ts_card_type set
doc_kind_id = (select id from SYS_CATEGORY where entity_type='garant$CreditOrder' and name = 'Заявка на кредит' limit 1)
where discriminator = 427 and name = 'garant$CreditOrder'
^
---

------------ TASK -----------------------
INSERT INTO sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, 'Заявка на кредит', NULL, 'tm$Task', NULL, 2, NULL);
^
INSERT INTO tm_task_type
(category_id, category_attrs_place, code, description, fields_xml, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, tab_name)
VALUES((select id from sys_category where name ='Заявка на кредит' and (entity_type = 'tm$Task' or entity_type = 'garant$ExtTask') limit 1), 1, '427', 'Заявка на кредит', '', NULL, NULL, 1, NULL, NULL, NULL, NULL, 'Доп. поля');
^
-- begin update discriminator for ExtTask
update WF_CARD set CARD_TYPE = '2000' where CARD_TYPE = '20' ^
-- end update discriminator for ExtTask
