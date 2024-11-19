/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.credit;

import com.company.garant.service.ProjectService;
import com.haulmont.cuba.core.global.Messages;
import com.haulmont.cuba.gui.Dialogs;
import com.haulmont.cuba.gui.components.DialogAction;
import com.haulmont.cuba.gui.components.HasValue;
import com.haulmont.cuba.gui.components.TextField;
import com.haulmont.cuba.gui.screen.*;
import com.company.garant.entity.Credit;
import com.haulmont.cuba.gui.util.OperationResult;
import com.haulmont.thesis.core.entity.Bank;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.atomic.AtomicReference;

@UiController("garant$Credit.edit")
@UiDescriptor("credit-edit.xml")
@EditedEntityContainer("creditDc")
@LoadDataBeforeShow
public class CreditEdit extends StandardEditor<Credit> {
    @Autowired
    protected TextField<Double> sumField;
    @Autowired
    protected TextField<Double> bankCreditSum;
    @Autowired
    protected Dialogs dialogs;
    @Autowired
    protected Messages messages;
    @Autowired
    protected ProjectService projectService;
    @Subscribe
    public void onBeforeCommitChanges(BeforeCommitChangesEvent event) {
        if (sumField.getValue() == null || sumField.getValue() == 0) {
            dialogs.createOptionDialog()
                    .withCaption(messages.getMessage(this.getClass(), "caption1CreditEdit"))
                    .withMessage(messages.getMessage(this.getClass(), "message1CreditEdit"))
                    .withActions(
                            new DialogAction(DialogAction.Type.YES),
                            new DialogAction(DialogAction.Type.NO).withHandler(e -> {
                                event.preventCommit();
                                event.resume();
                            })
                    )
                    .show();
        }
    }

    @Subscribe("bankField")
    public void onBankFieldValueChange(HasValue.ValueChangeEvent<Bank> event) {
        if (event.getValue() != null) {
            bankCreditSum.setValue(projectService.getBankCreditSum(event.getValue()));
        } else bankCreditSum.setValue(0D);
    }


}