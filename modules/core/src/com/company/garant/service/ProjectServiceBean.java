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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;


@Service(ProjectService.NAME)
public class ProjectServiceBean implements ProjectService {
    @Autowired
    protected DataManager dataManager;

    //Создайте сервис, который принимает в качестве параметра «Заявку на кредит» и возвращает
    // общее количество заявок заёмщика в определённом банке. Банк выбирается из сущности
    // "Кредит", связанной с этой "Заявкой на кредит"
    // название по п. в задании.
    @Override
    public List<Number> getCreditOrderInfo(@NotNull CreditOrder creditOrder) {

        if (creditOrder.getContractor() == null || creditOrder.getCredit() == null || creditOrder.getCredit().getBank() == null)
            return null;

        List<CreditOrder> creditList = dataManager.load(CreditOrder.class)
                .query("select o from garant$CreditOrder o where o.contractor.id = :contractorId and o.credit.bank.id = :bankId")
                .parameter("bankId", creditOrder.getCredit().getBank().getId())
                .parameter("contractorId", creditOrder.getContractor().getId())
                .view(View.MINIMAL)
                .viewProperties("credit.sum")
                .list();

        if (creditList.isEmpty())
            return null;
        else {
            final List<Number> creditOrderInfo = new ArrayList<>(2);

            creditOrderInfo.add(0, creditList.size());
            creditOrderInfo.add(1, creditList.stream()
                    .filter(co -> co != null && co.getCredit() != null)
                    .map(CreditOrder::getCredit)
                    .mapToDouble(Credit::getSum)
                    .sum());
            return creditOrderInfo;
        }

    }

    //2 Создать сервис считающий сумму(getSum) всех кредитов в конкретном банке, банк передается в сервис
    // как параметр
    @Override
    public Double getBankCreditSum(@NotNull Bank bank) {
        //сумма кредитов банка.
        List<Credit> creditList = dataManager.load(Credit.class)
                .query("select c from garant$Credit c where c.bank.id = :bankId")
                .parameter("bankId", bank.getId())
                .view(View.MINIMAL)
                .viewProperties("sum")
                .list();
        if (creditList.isEmpty())
            return 0D;
        else
            return creditList.stream()
                    .filter(credit -> credit != null && credit.getSum() != null)
                    .mapToDouble(Credit::getSum)
                    .sum();
    }


    //3. Создать сервис увеличивающий сумму всех кредита по определенному типу кредита. Сервис
    //принимает 2 параметра: Тип кредита и число на которое нужно увеличить кредиты.
    // название по п. в задании.
    @Override
    public void addCreditTypeSum(@NotNull CreditType creditType, @NotNull Double sum) {
        //увеличить все кредиты этого типа на сумму
        List<Credit> creditList = dataManager.load(Credit.class)
                .query("select c from garant$Credit c where c.creditType.id = :creditTypeId")
                .parameter("creditTypeId", creditType.getId())
                .view(View.MINIMAL)
                .viewProperties("sum")
                .list();

        CommitContext commitContext = new CommitContext();
        creditList.forEach(credit -> {
            credit.setSum(credit.getSum() == null ? sum : credit.getSum() + sum);
            commitContext.addInstanceToCommit(credit);
        });


        dataManager.commit(commitContext);
    }
}