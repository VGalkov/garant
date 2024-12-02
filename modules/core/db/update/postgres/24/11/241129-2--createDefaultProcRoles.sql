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