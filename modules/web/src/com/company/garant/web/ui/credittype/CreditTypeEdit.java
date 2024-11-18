/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.credittype;

import com.haulmont.cuba.core.app.UniqueNumbersService;
import com.haulmont.cuba.gui.components.TextField;
import com.haulmont.cuba.gui.screen.*;
import com.company.garant.entity.CreditType;
import org.springframework.beans.factory.annotation.Autowired;

@UiController("garant$CreditType.edit")
@UiDescriptor("credit-type-edit.xml")
@EditedEntityContainer("creditTypeDc")
@LoadDataBeforeShow
public class CreditTypeEdit extends StandardEditor<CreditType> {
    @Autowired
    private TextField<String> codeField;
    @Autowired
    private UniqueNumbersService uniqueNumbersService;

    @Subscribe
    public void onInitEntity(InitEntityEvent<CreditType> event) {
        //TODO сделать счётчик.
        String value = String.valueOf(uniqueNumbersService.getNextNumber("zzzz?"));
        codeField.setValue(value);
        getEditedEntity().setCode(value);
    }


}