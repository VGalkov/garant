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
import com.haulmont.cuba.gui.components.HasValue;
import com.haulmont.cuba.gui.components.SearchPickerField;
import com.haulmont.cuba.gui.screen.*;
import com.haulmont.thesis.core.entity.Contractor;
import org.springframework.beans.factory.annotation.Autowired;

@UiController("garant$CreditOrder.edit")
@UiDescriptor("credit-order-edit.xml")
@EditedEntityContainer("creditOrderDc")
@LoadDataBeforeShow
public class CreditOrderEdit extends StandardEditor<CreditOrder> {
    @Autowired
    protected ProjectService projectService;
    //1. На экране редактирования "Заявки на кредит" измените тип поля "Заемщик" на SearchPickerField
    @Autowired
    protected SearchPickerField<Contractor> contractorField;
    @Autowired
    protected Notifications notifications;
    @Autowired
    protected Messages messages;

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
        if (event.getValue() != null && event.getValue().getBank() != null && contractorField.getValue() != null)
            notifications.create(Notifications.NotificationType.TRAY)
                    .withCaption(
                            messages.formatMessage(
                                    this.getClass(),
                                    "contractorCreditNumber",
                                    projectService.getServiceOneSum(getEditedEntity()),
                                    event.getValue().getBank().getName()
                            )
                    )
                    .show();
    }

}