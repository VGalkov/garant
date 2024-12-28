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
import java.util.List;

public interface ProjectService {
    String NAME = "garant_ProjectService";

    //Создайте сервис, который принимает в качестве параметра «Заявку на кредит» и возвращает
    // общее количество заявок заёмщика в определённом банке. Банк выбирается из сущности
    // "Кредит", связанной с этой "Заявкой на кредит"
    List<Number> getCreditOrderInfo(CreditOrder creditOrder);

    Double getBankCreditSum(@NotNull Bank bank);

    void addCreditTypeSum(@NotNull CreditType creditType, @NotNull Double sum);

}