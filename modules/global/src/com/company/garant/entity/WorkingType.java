/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.entity;

import com.haulmont.chile.core.datatypes.impl.EnumClass;

import javax.annotation.Nullable;


public enum WorkingType implements EnumClass<Integer> {

    NOT_WORKING(0),
    WORKING(1);

    private Integer id;

    WorkingType(Integer value) {
        this.id = value;
    }

    public Integer getId() {
        return id;
    }

    @Nullable
    public static WorkingType fromId(Integer id) {
        for (WorkingType at : WorkingType.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}