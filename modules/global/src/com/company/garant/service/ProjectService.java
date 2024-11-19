/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.service;

import com.company.garant.entity.CreditOrder;
import com.company.garant.entity.CreditType;
import com.haulmont.thesis.core.entity.Bank;

import javax.validation.constraints.NotNull;

public interface ProjectService {
    String NAME = "garant_ProjectService";

    Integer getBankCreditNumber(@NotNull Bank bank);
    Double getBankCreditSum(@NotNull Bank bank);

    void addCreditTypeSum(@NotNull CreditType creditType, @NotNull Double sum);
}