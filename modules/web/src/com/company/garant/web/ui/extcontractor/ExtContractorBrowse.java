/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.extcontractor;

import com.company.garant.entity.ExtContractor;
import com.haulmont.cuba.gui.screen.*;

@UiController("garant$ExtContractor.browse")
@UiDescriptor("ext-contractor-browse.xml")
@LookupComponent("extContractorsTable")
@LoadDataBeforeShow
public class ExtContractorBrowse extends StandardLookup<ExtContractor> {
}