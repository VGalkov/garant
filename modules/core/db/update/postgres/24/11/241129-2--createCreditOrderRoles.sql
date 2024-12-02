insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Manager', 'Менеджер', 'Менеджер', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'Operator', 'Оператор', 'Оператор', 0, false, '10');


insert into sec_role(id, create_ts, created_by, version, name, loc_name,description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'securityDepartment', 'Служба безопасности', 'Служба безопасности', 0, false, '10');

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role, dtype) values
(newId(), now(), 'system', 1,'legalDepartment', 'Юридический отдел', 'Юридический отдел', 0, false, '10');
 ^
