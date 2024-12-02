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


    @Override
    protected void cardPropertyChanged(String property, Object prevValue, Object value) {
        super.cardPropertyChanged(property, prevValue, value);
        if ("credit".equals(property))
            if (value != null && ((Credit)value).getBank() != null && contractorField.getValue() != null)
                notifications.create(Notifications.NotificationType.TRAY)
                        .withCaption(messages.formatMessage(
                                this.getClass(),
                                "contractorCreditNumber",
                                projectService.getBankCreditNumber(((Credit)value).getBank()),
                                ((Credit)value).getBank().getName())
                        ).show();
    }

}