-- begin update discriminator for ExtTask
update WF_CARD set CARD_TYPE = '2000' where CARD_TYPE = '20' ^
-- end update discriminator for ExtTask
^
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
NULL, NULL, 1, NULL, NULL, NULL, NULL, (select id from ts_card_type where discriminator = 427 and name = 'garant$CreditOrder' limit 1), '427', NULL, '', NULL, 1, NULL, 1, true, NULL, 'Доп. поля', false, false, false, true);
^
update ts_card_type set
doc_kind_id = (select id from SYS_CATEGORY where entity_type='garant$CreditOrder' and name = 'Заявка на кредит' limit 1)
where discriminator = 427 and name = 'garant$CreditOrder'
^
-----------------------------------------



