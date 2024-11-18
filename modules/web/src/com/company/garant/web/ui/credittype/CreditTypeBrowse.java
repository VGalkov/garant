/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.credittype;

import com.haulmont.cuba.gui.screen.*;
import com.company.garant.entity.CreditType;

@UiController("garant$CreditType.browse")
@UiDescriptor("credit-type-browse.xml")
@LookupComponent("creditTypesTable")
@LoadDataBeforeShow
public class CreditTypeBrowse extends StandardLookup<CreditType> {
}