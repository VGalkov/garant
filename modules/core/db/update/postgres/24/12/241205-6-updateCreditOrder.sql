/*
-- не в полной мере инсталит нужных пользователей && сотрудников. лучше вручную или запускать и редактировать каждого сотрудника.
INSERT INTO df_correspondent
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", "type", organization_id, has_attachments)
VALUES(newid(), now(), 'admin', 2, now(), NULL, NULL, NULL, 'mmm m. m.', 'E', NULL, false);
^
INSERT INTO df_employee
(correspondent_id, name, first_name, last_name, middle_name, position_id, phone, fax, email, comment_, department_id, sex, user_id, number_, mobile_phone, photo_file_id, avatar_file_id, mobile_avatar_file_id, facsimile_file_id, birthday, edm_certificate_thumbprint, personal_data_id, hr_data_id)
VALUES((select id from df_correspondent where name ='mmm m. m.'), NULL, 'm', 'mmm', 'm', NULL, NULL, NULL, 'mmmm@dsffgdf.ru', NULL, NULL, 'M', (select id from sec_user where login = 'mmm'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO tshr_personal_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, is_resident, residential_address, mobile_phone, email, family_status_id, children_amount, is_wage_deductions, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='mmm m. m.'), true, NULL, NULL, NULL, NULL, NULL, false, 'mmm m. m.');
^
INSERT INTO tshr_hr_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, city, office_address, region_id, employment_date, manager_id, is_sick_leave, sick_leave_until, employee_working_status, dismissal_date, employment_contract_number, employment_contract_date, nature_of_work, pre_tax_salary, salary_currency_id, work_experience_years, work_experience_months, work_experience_days, is_remote, is_irregular_working_hours, is_part_time_worker, is_self_employed, main_vacation_balance, additional_vacation_balance, main_vacation_annual_limit, additional_vacation_annual_lim, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='mmm m. m.'), NULL, NULL, NULL, NULL, NULL, false, NULL, 10, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 28, 0, 'mmm m. m.');
^
update DF_EMPLOYEE set personal_data_id=(select id from tshr_personal_data where comment_ = 'mmm m. m.'), hr_data_id = (select id from tshr_hr_data where comment_ = 'mmm m. m.') where last_name = 'mmm'
^

--- ooo o. o.
INSERT INTO df_correspondent
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", "type", organization_id, has_attachments)
VALUES(newid(), now(), 'admin', 2, now(), NULL, NULL, NULL, 'ooo o.o.', 'E', NULL, false);
^
INSERT INTO df_employee
(correspondent_id, name, first_name, last_name, middle_name, position_id, phone, fax, email, comment_, department_id, sex, user_id, number_, mobile_phone, photo_file_id, avatar_file_id, mobile_avatar_file_id, facsimile_file_id, birthday, edm_certificate_thumbprint, personal_data_id, hr_data_id)
VALUES((select id from df_correspondent where name ='ooo o.o.'), NULL, 'o', 'ooo', 'o', NULL, NULL, NULL, 'mmmm@dsffgdf.ru', NULL, NULL, 'M', (select id from sec_user where login = 'ooo'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO tshr_personal_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, is_resident, residential_address, mobile_phone, email, family_status_id, children_amount, is_wage_deductions, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='ooo o.o.'), true, NULL, NULL, NULL, NULL, NULL, false, 'ooo o.o.');
^
INSERT INTO tshr_hr_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, city, office_address, region_id, employment_date, manager_id, is_sick_leave, sick_leave_until, employee_working_status, dismissal_date, employment_contract_number, employment_contract_date, nature_of_work, pre_tax_salary, salary_currency_id, work_experience_years, work_experience_months, work_experience_days, is_remote, is_irregular_working_hours, is_part_time_worker, is_self_employed, main_vacation_balance, additional_vacation_balance, main_vacation_annual_limit, additional_vacation_annual_lim, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='ooo o.o.'), NULL, NULL, NULL, NULL, NULL, false, NULL, 10, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 28, 0, 'ooo o.o.');
^
update DF_EMPLOYEE set personal_data_id=(select id from tshr_personal_data where comment_ = 'ooo o.o.'), hr_data_id = (select id from tshr_hr_data where comment_ = 'ooo o.o.') where last_name = 'ooo'
^
--- lll l.l.
INSERT INTO df_correspondent
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", "type", organization_id, has_attachments)
VALUES(newid(), now(), 'admin', 2, now(), NULL, NULL, NULL, 'lll l.l.', 'E', NULL, false);
^
INSERT INTO df_employee
(correspondent_id, name, first_name, last_name, middle_name, position_id, phone, fax, email, comment_, department_id, sex, user_id, number_, mobile_phone, photo_file_id, avatar_file_id, mobile_avatar_file_id, facsimile_file_id, birthday, edm_certificate_thumbprint, personal_data_id, hr_data_id)
VALUES((select id from df_correspondent where name ='lll l.l.'), NULL, 'l', 'lll', 'l', NULL, NULL, NULL, 'mmmm@dsffgdf.ru', NULL, NULL, 'M', (select id from sec_user where login = 'lll'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO tshr_personal_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, is_resident, residential_address, mobile_phone, email, family_status_id, children_amount, is_wage_deductions, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='lll l.l.'), true, NULL, NULL, NULL, NULL, NULL, false, 'lll l.l.');
^
INSERT INTO tshr_hr_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, city, office_address, region_id, employment_date, manager_id, is_sick_leave, sick_leave_until, employee_working_status, dismissal_date, employment_contract_number, employment_contract_date, nature_of_work, pre_tax_salary, salary_currency_id, work_experience_years, work_experience_months, work_experience_days, is_remote, is_irregular_working_hours, is_part_time_worker, is_self_employed, main_vacation_balance, additional_vacation_balance, main_vacation_annual_limit, additional_vacation_annual_lim, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='lll l.l.'), NULL, NULL, NULL, NULL, NULL, false, NULL, 10, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 28, 0, 'lll l.l.');
^
update DF_EMPLOYEE set personal_data_id=(select id from tshr_personal_data where comment_ = 'lll l.l.'), hr_data_id = (select id from tshr_hr_data where comment_ = 'lll l.l.') where last_name = 'lll'
^
--- ppp2 p.p.
INSERT INTO df_correspondent
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", "type", organization_id, has_attachments)
VALUES(newid(), now(), 'admin', 2, now(), NULL, NULL, NULL, 'ppp2 p.p.', 'E', NULL, false);
^
INSERT INTO df_employee
(correspondent_id, name, first_name, last_name, middle_name, position_id, phone, fax, email, comment_, department_id, sex, user_id, number_, mobile_phone, photo_file_id, avatar_file_id, mobile_avatar_file_id, facsimile_file_id, birthday, edm_certificate_thumbprint, personal_data_id, hr_data_id)
VALUES((select id from df_correspondent where name ='ppp2 p.p.'), NULL, 'p2', 'ppp2', 'p2', NULL, NULL, NULL, 'mmmm@dsffgdf.ru', NULL, NULL, 'M', (select id from sec_user where login = 'ppp2'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO tshr_personal_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, is_resident, residential_address, mobile_phone, email, family_status_id, children_amount, is_wage_deductions, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='ppp2 p.p.'), true, NULL, NULL, NULL, NULL, NULL, false, 'ppp2 p.p.');
^
INSERT INTO tshr_hr_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, city, office_address, region_id, employment_date, manager_id, is_sick_leave, sick_leave_until, employee_working_status, dismissal_date, employment_contract_number, employment_contract_date, nature_of_work, pre_tax_salary, salary_currency_id, work_experience_years, work_experience_months, work_experience_days, is_remote, is_irregular_working_hours, is_part_time_worker, is_self_employed, main_vacation_balance, additional_vacation_balance, main_vacation_annual_limit, additional_vacation_annual_lim, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='ppp2 p.p.'), NULL, NULL, NULL, NULL, NULL, false, NULL, 10, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 28, 0, 'ppp2 p.p.');
^
update DF_EMPLOYEE set personal_data_id=(select id from tshr_personal_data where comment_ = 'ppp2 p.p.'), hr_data_id = (select id from tshr_hr_data where comment_ = 'ppp2 p.p.') where last_name = 'ppp2'
^
--- ppp p.p.
INSERT INTO df_correspondent
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", "type", organization_id, has_attachments)
VALUES(newid(), now(), 'admin', 2, now(), NULL, NULL, NULL, 'ppp p.p.', 'E', NULL, false);
^
INSERT INTO df_employee
(correspondent_id, name, first_name, last_name, middle_name, position_id, phone, fax, email, comment_, department_id, sex, user_id, number_, mobile_phone, photo_file_id, avatar_file_id, mobile_avatar_file_id, facsimile_file_id, birthday, edm_certificate_thumbprint, personal_data_id, hr_data_id)
VALUES((select id from df_correspondent where name ='ppp p.p.'), NULL, 'p', 'ppp', 'p', NULL, NULL, NULL, 'mmmm@dsffgdf.ru', NULL, NULL, 'M', (select id from sec_user where login = 'ppp'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO tshr_personal_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, is_resident, residential_address, mobile_phone, email, family_status_id, children_amount, is_wage_deductions, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='ppp p.p.'), true, NULL, NULL, NULL, NULL, NULL, false, 'ppp p.p.');
^
INSERT INTO tshr_hr_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, city, office_address, region_id, employment_date, manager_id, is_sick_leave, sick_leave_until, employee_working_status, dismissal_date, employment_contract_number, employment_contract_date, nature_of_work, pre_tax_salary, salary_currency_id, work_experience_years, work_experience_months, work_experience_days, is_remote, is_irregular_working_hours, is_part_time_worker, is_self_employed, main_vacation_balance, additional_vacation_balance, main_vacation_annual_limit, additional_vacation_annual_lim, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='ppp p.p.'), NULL, NULL, NULL, NULL, NULL, false, NULL, 10, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 28, 0, 'ppp p.p.');
^
update DF_EMPLOYEE set personal_data_id=(select id from tshr_personal_data where comment_ = 'ppp p.p.'), hr_data_id = (select id from tshr_hr_data where comment_ = 'ppp p.p.') where last_name = 'ppp'
^
--- sss s.s.
INSERT INTO df_correspondent
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", "type", organization_id, has_attachments)
VALUES(newid(), now(), 'admin', 2, now(), NULL, NULL, NULL, 'sss s.s.', 'E', NULL, false);
^
INSERT INTO df_employee
(correspondent_id, name, first_name, last_name, middle_name, position_id, phone, fax, email, comment_, department_id, sex, user_id, number_, mobile_phone, photo_file_id, avatar_file_id, mobile_avatar_file_id, facsimile_file_id, birthday, edm_certificate_thumbprint, personal_data_id, hr_data_id)
VALUES((select id from df_correspondent where name ='sss s.s.'), NULL, 's', 'sss', 's', NULL, NULL, NULL, 'mmmm@dsffgdf.ru', NULL, NULL, 'M', (select id from sec_user where login = 'sss'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
^
INSERT INTO tshr_personal_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, is_resident, residential_address, mobile_phone, email, family_status_id, children_amount, is_wage_deductions, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='sss s.s.'), true, NULL, NULL, NULL, NULL, NULL, false, 'sss s.s.');
^
INSERT INTO tshr_hr_data
(id, "version", create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, city, office_address, region_id, employment_date, manager_id, is_sick_leave, sick_leave_until, employee_working_status, dismissal_date, employment_contract_number, employment_contract_date, nature_of_work, pre_tax_salary, salary_currency_id, work_experience_years, work_experience_months, work_experience_days, is_remote, is_irregular_working_hours, is_part_time_worker, is_self_employed, main_vacation_balance, additional_vacation_balance, main_vacation_annual_limit, additional_vacation_annual_lim, comment_)
VALUES(newid(), 1, now(), 'admin', now(), NULL, NULL, NULL, (select id from df_correspondent where name ='sss s.s.'), NULL, NULL, NULL, NULL, NULL, false, NULL, 10, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 28, 0, 'sss s.s.');
^
update DF_EMPLOYEE set personal_data_id=(select id from tshr_personal_data where comment_ = 'sss s.s.'), hr_data_id = (select id from tshr_hr_data where comment_ = 'sss s.s.') where last_name = 'sss'
^
-- ===================== отделы зачем-то нужны для запуска процесс(видимость пользователей)
INSERT INTO df_correspondent
(id, create_ts, created_by, "version", update_ts, updated_by, delete_ts, deleted_by, "name", "type", organization_id, has_attachments)
VALUES(newid(), now(), 'admin', 1, now(), NULL, NULL, NULL, 'кредитный отдел', 'D', (select id from df_organization where name = 'Наша организация' limit 1), false);
^
INSERT INTO df_department
(correspondent_id, code, parent_department_id)
VALUES((select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1),'02', NULL);
^
update DF_EMPLOYEE set department_id = (select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1)
^
update DF_CORRESPONDENT set organization_id = (select id from df_organization where name = 'Наша организация' limit 1) where organization_id is null
^

INSERT INTO df_employee_department_pos
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, department_id, position_id, is_main)
VALUES(newid(), now(), 'admin', now(), NULL, NULL, NULL,
(select id from df_correspondent where name ='sss s.s.'),
(select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1), NULL, true);

INSERT INTO df_employee_department_pos
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, department_id, position_id, is_main)
VALUES(newid(), now(), 'admin', now(), NULL, NULL, NULL,
(select id from df_correspondent where name ='lll l.l.'),
(select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1), NULL, true);

INSERT INTO df_employee_department_pos
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, department_id, position_id, is_main)
VALUES(newid(), now(), 'admin', now(), NULL, NULL, NULL,
(select id from df_correspondent where name ='ooo o.o.'),
(select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1), NULL, true);

INSERT INTO df_employee_department_pos
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, department_id, position_id, is_main)
VALUES(newid(), now(), 'admin', now(), NULL, NULL, NULL,
(select id from df_correspondent where name ='mmm m. m.'),
(select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1), NULL, true);

INSERT INTO df_employee_department_pos
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, department_id, position_id, is_main)
VALUES(newid(), now(), 'admin', now(), NULL, NULL, NULL,
(select id from df_correspondent where name ='ppp p.p.'),
(select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1), NULL, true);

INSERT INTO df_employee_department_pos
(id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, employee_id, department_id, position_id, is_main)
VALUES(newid(), now(), 'admin', now(), NULL, NULL, NULL,
(select id from df_correspondent where name ='ppp2 p.p.'),
(select id from df_correspondent where name = 'кредитный отдел' and organization_id = (select id from df_organization where name = 'Наша организация' limit 1) and type = 'D' limit 1), NULL, true);
^
---
*/