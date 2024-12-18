/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.credittype;

import com.company.garant.entity.CreditType;
import com.company.garant.service.ProjectService;
import com.haulmont.cuba.core.global.Messages;
import com.haulmont.cuba.gui.Dialogs;
import com.haulmont.cuba.gui.Notifications;
import com.haulmont.cuba.gui.app.core.inputdialog.DialogActions;
import com.haulmont.cuba.gui.app.core.inputdialog.DialogOutcome;
import com.haulmont.cuba.gui.app.core.inputdialog.InputParameter;
import com.haulmont.cuba.gui.components.GroupTable;
import com.haulmont.cuba.gui.screen.*;
import org.springframework.beans.factory.annotation.Autowired;

@UiController("garant$CreditType.browse")
@UiDescriptor("credit-type-browse.xml")
@LookupComponent("creditTypesTable")
@LoadDataBeforeShow
public class CreditTypeBrowse extends StandardLookup<CreditType> {
    @Autowired
    protected GroupTable<CreditType> creditTypesTable;
    @Autowired
    protected Dialogs dialogs;
    @Autowired
    protected Messages messages;
    @Autowired
    protected ProjectService projectService;
    @Autowired
    protected Notifications notifications;
    /*
    2. Измените экран выбора сущности "Вид кредита", добавьте кнопку для изменения суммы всех
выданных кредитов данного типа. При нажатии на кнопку показывать окно для ввода значения
суммы на которую нужно увеличить кредиты. Используете ранее написанный сервис

     */

    public void addNewSum() {
        if (creditTypesTable.getSelected().isEmpty()) {
            notifications.create(Notifications.NotificationType.TRAY)
                    .withCaption(messages.getMessage(this.getClass(), "chooseCreditType"))
                    .show();
        } else {
            dialogs.createInputDialog(this).withCaption(messages.getMessage(this.getClass(), "changeLocationDialog"))
                    .withParameters(
                            InputParameter
                                    .doubleParameter("sum")
                                    .withCaption(messages.getMessage(this.getClass(), "sum"))
                                    .withRequired(true)
                                    .withDefaultValue(0D)
                    )
                    .withActions(DialogActions.OK_CANCEL)
                    .withCloseListener(closeEvent -> {
                                if (closeEvent.closedWith(DialogOutcome.OK) && closeEvent.getValue("sum") != null)
                                    addCreditTypeSum(closeEvent.getValue("sum"));
                            }
                    ).show();
        }
    }

    protected void addCreditTypeSum(Double sum) {
        creditTypesTable.getSelected().forEach(creditType -> projectService.addCreditTypeSum(creditType, sum));
    }
}