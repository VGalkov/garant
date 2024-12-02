/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.creditorder;

import com.company.garant.entity.CreditOrder;
import com.haulmont.thesis.web.ui.simpledoc.SimpleDocBrowser;

import java.util.Map;

public class CreditOrderBrowse extends SimpleDocBrowser<CreditOrder> {
    @Override
    public void init(Map<String, Object> params) {
        super.init(params);
        entityName = "garant$CreditOrder";
    }
}