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

INSERT INTO ts_card_type(id, create_ts, created_by, "name", discriminator, doc_kind_id, doc_template_id, fields_xml)
VALUES(newid(), now(), 'admin', 'garant$CreditOrder', 427, NULL, NULL, '<?xml version="1.0" encoding="UTF-8"?>

<fields>
  <field name="projects" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docReceiver" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="resolution" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="number" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalAuthorEmail" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="finishDatePlan" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="orderText" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="orderCause" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="contractor" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docSender" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="theme" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="address" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalAuthorName" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalPublishState" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="organization" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="date" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="employeeExecutor" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="officeSignedBy" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="responseToDoc" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="officeExecutor" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="sender" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="receivingMethod" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="fromPortal" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docCopyReceiver" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="postTrackingNumber" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="parentCardAccess" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="credit" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalPublishErrorDescription" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="addressees" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="parentCard" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="availableForAll" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="workingType" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="repaymentAmount" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docCategory" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="department" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="owner" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="comment" inDocKind="true" visible="true" required="false" signed="false"/>
</fields>
');
^

INSERT INTO sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'Заявка на кредит', NULL, 'garant$CreditOrder', NULL, 1, NULL);
^


INSERT INTO public.df_doc_kind
(category_id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, doc_type_id, code, description, fields_xml, numerator_id, numerator_type, prefix, category_attrs_place, use_all_procs, organization_id, tab_name, create_only_by_template, disable_add_process_actors, portal_publish_allowed, available_to_create_on_mob_cl)
VALUES((select id from SYS_CATEGORY where entity_type='garant$CreditOrder' and name = 'Заявка на кредит' limit 1),
NULL, NULL, 1, NULL, NULL, NULL, NULL, (select id from ts_card_type where discriminator = 427 and name = 'garant$CreditOrder' limit 1), '427', NULL, '<?xml version="1.0" encoding="UTF-8"?>

<fields>
  <field name="projects" visible="true" required="false" signed="false"/>
  <field name="docReceiver" visible="true" required="false" signed="false"/>
  <field name="resolution" visible="true" required="false" signed="false"/>
  <field name="number" visible="true" required="false" signed="false"/>
  <field name="portalAuthorEmail" visible="true" required="false" signed="false"/>
  <field name="finishDatePlan" visible="true" required="false" signed="false"/>
  <field name="orderText" visible="true" required="false" signed="false"/>
  <field name="orderCause" visible="true" required="false" signed="false"/>
  <field name="contractor" visible="true" required="false" signed="false"/>
  <field name="docSender" visible="true" required="false" signed="false"/>
  <field name="theme" visible="true" required="false" signed="false"/>
  <field name="address" visible="true" required="false" signed="false"/>
  <field name="portalAuthorName" visible="true" required="false" signed="false"/>
  <field name="portalPublishState" visible="true" required="false" signed="false"/>
  <field name="organization" visible="true" required="false" signed="false"/>
  <field name="date" visible="true" required="false" signed="false"/>
  <field name="employeeExecutor" visible="true" required="false" signed="false"/>
  <field name="officeSignedBy" visible="true" required="false" signed="false"/>
  <field name="responseToDoc" visible="true" required="false" signed="false"/>
  <field name="officeExecutor" visible="true" required="false" signed="false"/>
  <field name="sender" visible="true" required="false" signed="false"/>
  <field name="receivingMethod" visible="true" required="false" signed="false"/>
  <field name="fromPortal" visible="true" required="false" signed="false"/>
  <field name="docCopyReceiver" visible="true" required="false" signed="false"/>
  <field name="postTrackingNumber" visible="true" required="false" signed="false"/>
  <field name="parentCardAccess" visible="true" required="false" signed="false"/>
  <field name="credit" visible="true" required="false" signed="false"/>
  <field name="portalPublishErrorDescription" visible="true" required="false" signed="false"/>
  <field name="addressees" visible="true" required="false" signed="false"/>
  <field name="parentCard" visible="true" required="false" signed="false"/>
  <field name="availableForAll" visible="true" required="false" signed="false"/>
  <field name="workingType" visible="true" required="false" signed="false"/>
  <field name="repaymentAmount" visible="true" required="false" signed="false"/>
  <field name="docCategory" visible="true" required="false" signed="false"/>
  <field name="department" visible="true" required="false" signed="false"/>
  <field name="owner" visible="true" required="false" signed="false"/>
  <field name="comment" visible="true" required="false" signed="false"/>
</fields>
', NULL, 1, NULL, 1, true, NULL, NULL, false, false, false, true);
^
update ts_card_type set
doc_kind_id = (select id from SYS_CATEGORY where entity_type='garant$CreditOrder' and name = 'Заявка на кредит' limit 1)
where discriminator = 427 and name = 'garant$CreditOrder'
^
-- =====================

INSERT INTO public.sys_category
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", special, entity_type, is_default, discriminator, locale_names)
VALUES(newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, 'Заявка на кредит', NULL, 'tm$Task', NULL, 2, NULL);
^

INSERT INTO public.tm_task_type
(category_id, category_attrs_place, code, description, fields_xml, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, tab_name)
VALUES((select id from sys_category where name ='Заявка на кредит' and (entity_type = 'tm$Task' or entity_type = 'garant$ExtTask') limit 1), 1, '427', 'Заявка на кредит', '<?xml version="1.0" encoding="UTF-8"?>

<fields>
  <field name="propertySecurityTab" visible="true" required="false" signed="false"/>
  <field name="propertyAttachmentsTab" visible="true" required="false" signed="false"/>
  <field name="parentCardAccess" visible="true" required="false" signed="false"/>
  <field name="creditOrder" visible="true" required="true" signed="false"/>
  <field name="propertyTaskLogTab" visible="true" required="false" signed="false"/>
  <field name="confirmRequired" visible="true" required="false" signed="false"/>
  <field name="propertyCardCommentTab" visible="true" required="false" signed="false"/>
  <field name="parentCard" visible="true" required="false" signed="false"/>
  <field name="refuseEnabled" visible="true" required="false" signed="false"/>
  <field name="reassignEnabled" visible="true" required="false" signed="false"/>
  <field name="fullDescr" visible="true" required="false" signed="false"/>
  <field name="priority" visible="true" required="false" signed="false"/>
  <field name="propertyCardProjectsTab" visible="true" required="false" signed="false"/>
  <field name="propertyCardRelationsTab" visible="true" required="false" signed="false"/>
</fields>
', NULL, NULL, 1, NULL, NULL, NULL, NULL, 'Доп. поля');

^
--=====================================
insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Manager', 'Менеджер банка', 'Менеджер банка', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Operator', 'Оператор', 'Оператор', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'securityDepartment', 'Служба безопасности', 'Служба безопасности', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'legalDepartment', 'Юридический отдел', 'Юридический отдел', 0, false, '10');
^

-- после развёртки процесса -----------------------------
--insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1, (select id from wf_proc_role wpr where wpr.code = 'Оператор' ), true, 'garant_OperatorActorStrategy', '10');
--insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1, (select id from wf_proc_role wpr where wpr.code = 'Менеджер банка' ), true, 'garant_ManagerActorStrategy', '10');
--insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1,	(select id from wf_proc_role wpr where wpr.code = 'Юридический отдел' ), true, 'garant_LegalActorStrategy', '10');
--insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, version, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE) values (newid(), now(), 'system', 1,(select id from wf_proc_role wpr where wpr.code = 'Служба безопасности' ), true, 'garant_SbActorStrategy', '10');
--update WF_PROC set code='OnlineCreditOrderProcess', card_types =',garant$CreditOrder,', update_ts=now(), updated_by='system' where name = 'Согласование и выдача кредита'
--------------------------------------------------------

---Менеджер
INSERT INTO public.sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,
group_id,
group_names, ip_mask, change_password_at_logon,
organization_id,
is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(
newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'mmm', 'mmm', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'mmm m. m.', 'm', 'mmm', 'm', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,
(select id from SEC_GROUP where ='Руководитель департамента'),
NULL, NULL, true,
(select id from df_organization where "name"= 'Наша организация'),
false, NULL, NULL, NULL, '10');
пароль как имя, нужны ещё роли.
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'SimpleUser' limit 1),
NULL);
---
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'Manager' limit 1),
NULL);
---


---------------------------------------------------------------------------------------------------------------------
---Оператор
INSERT INTO public.sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,
group_id,
group_names, ip_mask, change_password_at_logon,
organization_id,
is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(
newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'ooo', 'ooo', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'ooo o. o.', 'o', 'ooo', 'o', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,
(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),
NULL, NULL, true,
(select id from df_organization where name= 'Наша организация'),
false, NULL, NULL, NULL, '10');

---
---роли -
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'SimpleUser' limit 1),
NULL);
---
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'Operator' limit 1),
NULL);
---




--------------------------------------------------------------------------------------------------------------------------
---юрист

INSERT INTO public.sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,
group_id,
group_names, ip_mask, change_password_at_logon,
organization_id,
is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(
newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'lll', 'lll', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'lll l.l.', 'l', 'lll', 'l', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,
(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),
NULL, NULL, true,
(select id from df_organization where name= 'Наша организация'),
false, NULL, NULL, NULL, '10');
--
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'SimpleUser' limit 1),
NULL);
---
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'legalDepartment' limit 1),
NULL);
---

--------------------------------------------------------------------------------------------------------------
---безопасник
INSERT INTO public.sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,
group_id,
group_names, ip_mask, change_password_at_logon,
organization_id,
is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(
newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'sss', 'sss', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'sss s.s.', 's', 's', 's', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,
(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),
NULL, NULL, true,
(select id from df_organization where name= 'Наша организация'),
false, NULL, NULL, NULL, '10');
---
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'SimpleUser' limit 1),
NULL);
---
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'securityDepartment' limit 1),
NULL);
---

-------------------------------------------------------------------------------------------------------------------
---пользователь 1
INSERT INTO public.sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,
group_id,
group_names, ip_mask, change_password_at_logon,
organization_id,
is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(
newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'ppp', 'ppp', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'ppp p.p.', 'p', 'p', 'p', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,
(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),
NULL, NULL, true,
(select id from df_organization where name= 'Наша организация'),
false, NULL, NULL, NULL, '10');
----
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'SimpleUser' limit 1),
NULL);




-----------------------------------------------------------------------------------------------------------------------
---пользователь 2
INSERT INTO public.sec_user
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, "password", password_encryption, "name", first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active,
group_id,
group_names, ip_mask, change_password_at_logon,
organization_id,
is_mobile, department_code, active_directory_id, use_active_directory, dtype)
VALUES(
newid(), now(), 'admin', 2, now(), 'admin', NULL, NULL, NULL, 'ppp2', 'ppp2', '7e23d6218c0d8d67f368e9cd223baa1c64948350', 'sha1', 'ppp2 p.p.', 'p2', 'p2', 'p2', NULL, 'mmmm@dsffgdf.ru', 'ru', NULL, NULL, true,
(select id from SEC_GROUP where name ='Ограниченный доступ + все документы'),
NULL, NULL, true,
(select id from df_organization where name= 'Наша организация'),
false, NULL, NULL, NULL, '10');
---
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'SimpleUser' limit 1),
NULL);
---------------------------------------------------------------------------------------------------------------------

---остальные роли добавлены скопом

-- на таску
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'task_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'task_observer' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'task_controller' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'task_executor' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'task_creator' limit 1),
NULL);

------------------------------------------

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'task_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'task_observer' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'task_controller' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'task_executor' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'task_creator' limit 1),
NULL);

-----------------------------------------------

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'task_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'task_observer' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'task_controller' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'task_executor' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'task_creator' limit 1),
NULL);


----------------------------------------

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'task_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'task_observer' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'task_controller' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'task_executor' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'task_creator' limit 1),
NULL);


----------------------------------

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'task_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'task_observer' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'task_controller' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'task_executor' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'task_creator' limit 1),
NULL);


-----------------------------------------------

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'task_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'task_observer' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'task_controller' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'task_executor' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'task_creator' limit 1),
NULL);


------------------------------------------

--- на доки
INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'doc_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'doc_endorsement' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'doc_secretary' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'doc_approver' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'doc_acquaintance' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp2'),
(select id from sec_role  where name = 'doc_publisher' limit 1),
NULL);

---------------

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'doc_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'doc_endorsement' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'doc_secretary' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'doc_approver' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'doc_acquaintance' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ppp'),
(select id from sec_role  where name = 'doc_publisher' limit 1),
NULL);

---------------------------------

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'doc_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'doc_endorsement' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'doc_secretary' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'doc_approver' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'doc_acquaintance' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'ooo'),
(select id from sec_role  where name = 'doc_publisher' limit 1),
NULL);



-----------------------------------


INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'doc_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'doc_endorsement' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'doc_secretary' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'doc_approver' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'doc_acquaintance' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'lll'),
(select id from sec_role  where name = 'doc_publisher' limit 1),
NULL);



-----------------------------------------


INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'doc_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'doc_endorsement' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'doc_secretary' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'doc_approver' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'doc_acquaintance' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'sss'),
(select id from sec_role  where name = 'doc_publisher' limit 1),
NULL);



----------------------------------


INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'doc_initiator' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'doc_endorsement' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'doc_secretary' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'doc_approver' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'doc_acquaintance' limit 1),
NULL);

INSERT INTO public.sec_user_role
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by,
user_id,
role_id,
role_name)
VALUES(
newid(), now(), 'admin', 1, now(), NULL, NULL, NULL,
(select id from sec_user where login = 'mmm'),
(select id from sec_role  where name = 'doc_publisher' limit 1),
NULL);

^
------------------------------------------

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
