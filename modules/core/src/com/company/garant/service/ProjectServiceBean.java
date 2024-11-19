/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.service;

import com.company.garant.entity.CreditOrder;
import com.company.garant.entity.CreditType;
import com.haulmont.thesis.core.entity.Bank;
import com.haulmont.thesis.core.entity.Contractor;
import org.springframework.stereotype.Service;


@Service(ProjectService.NAME)
public class ProjectServiceBean implements ProjectService {

    public Integer getCreditOrdersNumber(CreditOrder order) {
      //  Bank bank = order.getCredit().getBank();
       // Contractor contractor = order.getContractor();
        // посчитать все CreditOrder contractor-а
        return 0;
    }

    public Integer getBankCreditNumber(Bank bank) {
        //посчитать все Credit в Bank
        return 0;
    }

    @Override
    public Double getBankCreditSum(Bank bank) {
        //сумма кредитов банка.
        return 0D;
    }

    @Override
    public void addCreditTypeSum(CreditType creditType, Double sum) {
        //увеличить все кредиты этого типа на сумму
    }

}