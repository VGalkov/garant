/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.creditorder;


import com.company.garant.entity.Credit;
import com.company.garant.entity.CreditOrder;
import com.company.garant.service.ProjectService;
import com.haulmont.cuba.core.global.Messages;
import com.haulmont.cuba.gui.Notifications;
import com.haulmont.cuba.gui.components.SuggestionPickerField;
import com.haulmont.thesis.core.entity.Contractor;
import com.haulmont.thesis.web.ui.common.ActionsFrame;
import com.haulmont.thesis.web.ui.simpledoc.SimpleDocEditor;
import org.springframework.beans.factory.annotation.Autowired;

import javax.inject.Inject;

public class CreditOrderEdit extends SimpleDocEditor<CreditOrder> {
    @Inject
    private SuggestionPickerField<Contractor> contractorField;
    @Autowired
    protected ProjectService projectService;
    @Autowired
    protected Notifications notifications;
    @Autowired
    protected Messages messages;
    @Autowired
    protected ActionsFrame actionFrame;


    @Override
    protected void cardPropertyChanged(String property, Object prevValue, Object value) {
        super.cardPropertyChanged(property, prevValue, value);
        if ("credit".equals(property))
            if (value != null && ((Credit) value).getBank() != null && contractorField.getValue() != null) {
                notifications.create(Notifications.NotificationType.TRAY)
                        .withCaption(messages.formatMessage(
                                this.getClass(),
                                "contractorCreditNumber",
                                projectService.getBankCreditNumber(((Credit) value).getBank()),
                                ((Credit) value).getBank().getName())
                        ).show();
            } else if ("repaymentAmountField".equals(property))
                setProcTransitionGate();
    }

    @Override
    protected void postInit() {
        super.postInit();
        setProcTransitionGate();
    }

    protected void setProcTransitionGate() {
        //TODO блокировать экшен процессной кнопки, обеспечивающей переход Погашено через ->
        //Pogashenie_kredita.Proverka_pogasheniya ???? actionFrame == null &!&!&!&????????????????
        //this.getWrappedFrame().getComponents().stream().filter(component -> "cardProcFrame".equals(component.getId())).findFirst().get();
        if (actionFrame != null && actionFrame.getAction(".....") != null)
            actionFrame.getAction(".....").setEnabled(getEditedEntity().getRepaymentAmount() != 0D);
    }
}