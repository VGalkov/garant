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
    public Integer getServiceOneSum(@NotNull CreditOrder creditOrder) {

        if (creditOrder.getContractor() == null || creditOrder.getCredit() == null || creditOrder.getCredit().getBank() == null)
            return 0; //throw?

        List<CreditOrder> creditList = dataManager.load(CreditOrder.class)
                .query("select o from garant$CreditOrder o where o.contractor.id = :contractorId and o.credit.bank.id = :bankId")
                .parameter("bankId", creditOrder.getCredit().getBank().getId())
                .parameter("contractorId", creditOrder.getContractor().getId())
                .view(View.MINIMAL)
                .list();

        return creditList.size();
    }


    //Создать сервис считающий сумму всех кредитов в конкретном банке, банк передается в сервис
    // как параметр

    // ВНИМАНИЕ сервис сделан по прямому требованию задания, но не найдено место, где его применять!!!
    @Override
    public Integer getBankCreditNumber(@NotNull Bank bank) {
        //посчитать все Credit в Bank
        List<Credit> creditList = dataManager.load(Credit.class)
                .query("select c from garant$Credit c where c.bank.id = :bankId")
                .parameter("bankId", bank.getId())
                .view(View.MINIMAL)
                .list();
        return creditList.size();
    }


    //3. Добавьте на экран редактирования кредита поле «Общая сумма», которое будет показывать
    //общую сумму всех кредитов в выбранном банке. При смене банка сумма будет автоматически
    //пересчитываться
    @Override
    public Double getBankCreditSum(@NotNull Bank bank) {
        //сумма кредитов банка.
        List<Credit> creditList = dataManager.load(Credit.class)
                .query("select c from garant$Credit c where c.bank.id = :bankId")
                .parameter("bankId", bank.getId())
                .view(View.MINIMAL)
                .viewProperties("sum")
                .list();
        return creditList.stream()
                .filter(credit -> credit.getSum() != null)
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