/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.service;

import com.haulmont.cuba.core.global.DataManager;
import com.haulmont.cuba.core.global.View;
import com.haulmont.cuba.security.entity.User;
import com.haulmont.thesis.core.entity.Bank;
import com.haulmont.thesis.core.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service(CreditOrderStatisticsService.NAME)
public class CreditOrderStatisticsServiceBean implements CreditOrderStatisticsService {

    @Autowired
    protected ProjectService projectService;
    @Autowired
    protected DataManager dataManager;

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<Task> appointedTasks(User user) {
        //Получить список всех Задач назначенных на определенного пользователя, UUID пользователя
        //передается в параметре для запроса
        return dataManager.load(Task.class)
                .view(View.LOCAL)
                .query("select t from tm$Task t where t.executor.id = :userId")
                .parameter("userId", user.getId())
                .list();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public Double getBankCreditSum(Bank bank) {
        //  Вызвать ранее созданный сервис считающий сумму всех кредитов в банке
        return projectService.getBankCreditSum(bank);
    }

}