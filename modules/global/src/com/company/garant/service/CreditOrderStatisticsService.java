/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.service;

import com.haulmont.cuba.security.entity.User;
import com.haulmont.thesis.core.entity.Bank;
import com.haulmont.thesis.core.entity.Task;

import java.util.List;

public interface CreditOrderStatisticsService {
    String NAME = "garant_CreditOrderStatisticsService";

    List<Task> appointedTasks(User user);

    Double getBankCreditSum(Bank bank);
}
