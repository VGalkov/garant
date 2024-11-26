/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.entity;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.annotation.EmbeddedParameters;
import com.haulmont.thesis.core.entity.Contractor;
import com.haulmont.thesis.core.entity.SimpleDoc;

import javax.persistence.*;

@DiscriminatorValue("427")
@Table(name = "GARANT_CREDIT_ORDER")
@Entity(name = "garant$CreditOrder")
@NamePattern("%s|credit")
@PrimaryKeyJoinColumn(name = "ID", referencedColumnName = "ID")
public class CreditOrder extends SimpleDoc {
    private static final long serialVersionUID = -5910365044496776192L;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CREDIT_ID")
    protected Credit credit;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CONTRACTOR_ID")
    protected Contractor contractor;

    @Column(name = "WORKING_TYPE")
    protected Integer workingType;

    @Embedded
    @EmbeddedParameters(nullAllowed = false)
    @AttributeOverrides({
            @AttributeOverride(name = "city", column = @Column(name = "ADDRESS_CITY")),
            @AttributeOverride(name = "house", column = @Column(name = "ADDRESS_HOUSE")),
            @AttributeOverride(name = "street", column = @Column(name = "ADDRESS_STREET"))
    })
    protected Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public WorkingType getWorkingType() {
        return workingType == null ? null : WorkingType.fromId(workingType);
    }

    public void setWorkingType(WorkingType workingType) {
        this.workingType = workingType == null ? null : workingType.getId();
    }

    public Credit getCredit() {
        return credit;
    }

    public void setCredit(Credit credit) {
        this.credit = credit;
    }

    @Override
    public Contractor getContractor() {
        return contractor;
    }

    @Override
    public void setContractor(Contractor contractor) {
        this.contractor = contractor;
    }
}