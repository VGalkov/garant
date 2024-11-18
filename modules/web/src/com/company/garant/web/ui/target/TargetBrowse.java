/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.target;

import com.haulmont.cuba.gui.screen.*;
import com.company.garant.entity.Target;

@UiController("garant$Target.browse")
@UiDescriptor("target-browse.xml")
@LookupComponent("targetsTable")
@LoadDataBeforeShow
public class TargetBrowse extends StandardLookup<Target> {
}