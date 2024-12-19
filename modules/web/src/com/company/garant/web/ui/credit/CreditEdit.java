/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.credit;

import com.company.garant.entity.Credit;
import com.company.garant.service.ProjectService;
import com.haulmont.cuba.core.global.Messages;
import com.haulmont.cuba.gui.Dialogs;
import com.haulmont.cuba.gui.components.DialogAction;
import com.haulmont.cuba.gui.components.HasValue;
import com.haulmont.cuba.gui.components.TextField;
import com.haulmont.cuba.gui.screen.*;
import com.haulmont.thesis.core.entity.Bank;
import org.springframework.beans.factory.annotation.Autowired;

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
    private void onBeforeClose(Screen.BeforeCloseEvent event) {
        if (new StandardCloseAction("commit").equals(event.getCloseAction()) && sumField.getValue() == null) {
            dialogs.createOptionDialog()
                    .withCaption(messages.getMessage(this.getClass(), "caption1CreditEdit"))
                    .withMessage(messages.getMessage(this.getClass(), "message1CreditEdit"))
                    .withActions(
                            new DialogAction(DialogAction.Type.YES).withHandler(e -> close(StandardOutcome.CLOSE)),
                            new DialogAction(DialogAction.Type.NO)
                    )
                    .show();
            event.preventWindowClose();
        }
    }



    /*
    * 3. Добавьте на экран редактирования кредита поле «Общая сумма», которое будет показывать
общую сумму всех кредитов в выбранном банке. При смене банка сумма будет автоматически
пересчитываться
* */

    @Subscribe("bankField")
    public void onBankFieldValueChange(HasValue.ValueChangeEvent<Bank> event) {
        if (event.getValue() != null) {
            bankCreditSum.setValue(projectService.getBankCreditSum(event.getValue()));
        } else bankCreditSum.setValue(0D);
    }


}