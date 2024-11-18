/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.credit;

import com.haulmont.cuba.gui.screen.*;
import com.company.garant.entity.Credit;

@UiController("garant$Credit.browse")
@UiDescriptor("credit-browse.xml")
@LookupComponent("creditsTable")
@LoadDataBeforeShow
public class CreditBrowse extends StandardLookup<Credit> {
}