/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.service;

import com.company.garant.entity.Credit;
import com.company.garant.entity.CreditOrder;
import com.company.garant.entity.CreditType;
import com.haulmont.cuba.core.global.CommitContext;
import com.haulmont.cuba.core.global.DataManager;
import com.haulmont.cuba.core.global.View;
import com.haulmont.thesis.core.entity.Bank;
import com.haulmont.thesis.core.entity.Contractor;
import org.elasticsearch.search.aggregations.metrics.SumAggregator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service(ProjectService.NAME)
public class ProjectServiceBean implements ProjectService {
    @Autowired
    protected DataManager dataManager;

    public Integer getBankCreditNumber(Bank bank) {
        //посчитать все Credit в Bank
        List<Credit> creditList = dataManager.load(Credit.class)
                .query("select c from garant$Credit c where c.bank.id = :bankId")
                .parameter("bankId", bank.getId())
                .view(View.MINIMAL)
                .list();
        return creditList.size();
    }

    @Override
    public Double getBankCreditSum(Bank bank) {
        //сумма кредитов банка.
        List<Credit> creditList = dataManager.load(Credit.class)
                .query("select c from garant$Credit c where c.bank.id = :bankId")
                .parameter("bankId", bank.getId())
                .view(View.MINIMAL)
                .viewProperties("sum")
                .list();
        return creditList.stream().filter(credit -> credit.getSum() != null).mapToDouble(Credit::getSum).sum();
    }

    @Override
    public void addCreditTypeSum(CreditType creditType, Double sum) {
        //увеличить все кредиты этого типа на сумму
        List<Credit> creditList = dataManager.load(Credit.class)
                .query("select c from garant$Credit c where c.creditType.id = :creditTypeId")
                .parameter("creditTypeId", creditType.getId())
                .view(View.MINIMAL)
                .viewProperties("sum")
                .list();

        CommitContext commitContext = new CommitContext();
        creditList.forEach(credit -> {
            credit.setSum(credit.getSum() == null ? 0 : credit.getSum() + sum);
            commitContext.addInstanceToCommit(credit);
        });


        dataManager.commit(commitContext);
    }

}