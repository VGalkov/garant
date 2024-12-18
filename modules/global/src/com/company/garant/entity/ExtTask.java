/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.entity;

import com.haulmont.cuba.core.entity.annotation.Extends;
import com.haulmont.thesis.core.entity.Task;

import javax.persistence.*;

@javax.persistence.DiscriminatorValue("2000")
@Table(name = "TM_TASK")
@Entity(name = "garant$ExtTask")
@PrimaryKeyJoinColumn(name = "CARD_ID", referencedColumnName = "ID")
@Extends(Task.class)
public class ExtTask extends Task {
    private static final long serialVersionUID = 4888387787821121703L;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CREDIT_ORDER_ID")
    protected CreditOrder creditOrder;

    public CreditOrder getCreditOrder() {
        return creditOrder;
    }

    public void setCreditOrder(CreditOrder creditOrder) {
        this.creditOrder = creditOrder;
    }
}