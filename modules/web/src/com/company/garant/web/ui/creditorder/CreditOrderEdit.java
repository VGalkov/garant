/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.creditorder;


import com.company.garant.entity.Credit;
import com.company.garant.entity.CreditOrder;
import com.company.garant.service.ProjectService;
import com.haulmont.cuba.gui.Notifications;
import com.haulmont.cuba.gui.components.Component;
import com.haulmont.cuba.gui.components.HasValue;
import com.haulmont.cuba.gui.components.SuggestionPickerField;
import com.haulmont.cuba.gui.components.TextField;
import com.haulmont.cuba.gui.screen.Subscribe;
import com.haulmont.cuba.web.gui.components.WebButton;
import com.haulmont.thesis.core.entity.Contractor;
import com.haulmont.thesis.web.ui.simpledoc.SimpleDocEditor;
import org.springframework.beans.factory.annotation.Autowired;

public class CreditOrderEdit extends SimpleDocEditor<CreditOrder> {

    //1. На экране редактирования "Заявки на кредит" измените тип поля "Заемщик" на SearchPickerField
    //suggestionPickerField из-за воринга на версию тезиса
    @Autowired
    protected SuggestionPickerField<Contractor> contractorField;
    @Autowired
    protected ProjectService projectService;
    @Autowired
    protected TextField<Double> repaymentAmountField;
    private static final String POGASHENIE_TRANSITION_ACTION = "Pogashenie_kredita.Pogasil";
    private static final String CREDIT_ORDER_PROCESS = "OnlineCreditOrderProcess";

        /*
    При смене кредита на экране редактирования "Заявки на кредит", необходимо вызвать сервис,
который рассчитывает количество кредитов заёмщика в банке, и отображать количество с
помощью уведомления

 ВНИМАНИЕ! если при формировании данных могли бы быть нули, то уведомления не будет.
 Уведомления не будет и если текущий кредит контрактора - первый и единственный.
 По всему условию задания нигде не указано - должны ли не сохранённые ещё данные учитываться в выдаваемых данных.
 интуиция говорит, что не должны. поэтому так.
     */

    @Subscribe("creditField")
    public void onCreditFieldValueChange(HasValue.ValueChangeEvent<Credit> event) {
        showNotificationIfNeeded(event.getValue());
    }

    /*
    не разобрался по ТЗ и пихаю нотифай в оба варианта.
     */
    @Override
    protected boolean postCommit(boolean committed, boolean close) {
        showNotificationIfNeeded(getEditedEntity().getCredit());
        return super.postCommit(committed, close);
    }


    private void showNotificationIfNeeded(Credit credit) {
        if (credit != null && credit.getBank() != null && contractorField.getValue() != null)
            notifications.create(Notifications.NotificationType.TRAY)
                    .withCaption(
                            messages.formatMessage(
                                    this.getClass(),
                                    "contractorCreditNumber",
                                    projectService.getServiceOneSum(getEditedEntity()),
                                    credit.getBank().getName()
                            )
                    )
                    .show();
    }

    @Subscribe("repaymentAmountField")
    public void onRepaymentAmountValueChange(HasValue.ValueChangeEvent<Credit> event) {
        setTransitionActionState();
    }

    @Override
    protected void postInit() {
        super.postInit();
    }

    protected void setProcTransitionAviability() {
        if (getEditedEntity().getProc() != null &&
                CREDIT_ORDER_PROCESS.equals(getEditedEntity().getProc().getCode()) &&
                !actionsFrame.getProcActionsContainer().getComponents().isEmpty()
        )
            setTransitionActionState();
    }

    private void setTransitionActionState() {
        actionsFrame.getProcActionsContainer().getComponents().forEach(component -> {
            if (checkTransitionAction(component) && ((WebButton) component).getAction() != null)
                ((WebButton) component).getAction().setEnabled(
                        repaymentAmountField != null && repaymentAmountField.getValue() != null && repaymentAmountField.getValue() != 0D
                );
        });
    }

    private boolean checkTransitionAction(Component component) {
        return component instanceof WebButton &&
                ((WebButton) component).getAction() != null &&
                POGASHENIE_TRANSITION_ACTION.equals(((WebButton) component).getAction().getId());
    }

    protected void initActionsFrame() {
        super.initActionsFrame();
        setProcTransitionAviability();
    }
}