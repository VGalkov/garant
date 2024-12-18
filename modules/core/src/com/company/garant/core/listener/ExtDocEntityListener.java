/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.core.listener;

import com.haulmont.thesis.core.entity.Doc;
import com.haulmont.thesis.core.listener.DocEntityListener;

public class ExtDocEntityListener extends DocEntityListener {

    @Override
    protected String createDescription(Doc entity) {
        return "(!) " + super.createDescription(entity);
    }
}