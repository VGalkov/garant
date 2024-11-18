/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.credit;

import com.haulmont.cuba.core.global.Messages;
import com.haulmont.cuba.gui.Dialogs;
import com.haulmont.cuba.gui.components.DialogAction;
import com.haulmont.cuba.gui.components.TextField;
import com.haulmont.cuba.gui.screen.*;
import com.company.garant.entity.Credit;
import org.springframework.beans.factory.annotation.Autowired;

@UiController("garant$Credit.edit")
@UiDescriptor("credit-edit.xml")
@EditedEntityContainer("creditDc")
@LoadDataBeforeShow
public class CreditEdit extends StandardEditor<Credit> {
    @Autowired
    private TextField<Double> sumField;
    @Autowired
    private Dialogs dialogs;
    @Autowired
    protected Messages messages;

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

}