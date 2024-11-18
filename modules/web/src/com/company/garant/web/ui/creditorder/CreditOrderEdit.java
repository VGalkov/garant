/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.creditorder;

import com.haulmont.cuba.gui.screen.*;
import com.company.garant.entity.CreditOrder;

@UiController("garant$CreditOrder.edit")
@UiDescriptor("credit-order-edit.xml")
@EditedEntityContainer("creditOrderDc")
@LoadDataBeforeShow
public class CreditOrderEdit extends StandardEditor<CreditOrder> {
}