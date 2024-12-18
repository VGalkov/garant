/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.creditorder;

import com.company.garant.entity.CreditOrder;
import com.haulmont.cuba.gui.screen.*;

@UiController("garant$CreditOrder.browse")
@UiDescriptor("credit-order-browse.xml")
@LookupComponent("creditOrdersTable")
@LoadDataBeforeShow
public class CreditOrderBrowse extends StandardLookup<CreditOrder> {
}