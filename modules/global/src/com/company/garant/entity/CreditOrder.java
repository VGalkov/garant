/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.entity;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.annotation.EmbeddedParameters;
import com.haulmont.thesis.core.entity.Doc;
import com.haulmont.thesis.core.entity.Individual;

import javax.persistence.*;

@DiscriminatorValue("427")
@Table(name = "GARANT_CREDIT_ORDER")
@Entity(name = "garant$CreditOrder")
@NamePattern("%s %s|credit, loader")
@PrimaryKeyJoinColumn(name = "ID", referencedColumnName = "ID")
public class CreditOrder extends Doc {
    private static final long serialVersionUID = -5910365044496776192L;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CREDIT_ID")
    protected Credit credit;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LOADER_ID")
    protected Individual loader;

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

    public Individual getLoader() {
        return loader;
    }

    public void setLoader(Individual loader) {
        this.loader = loader;
    }

    public Credit getCredit() {
        return credit;
    }

    public void setCredit(Credit credit) {
        this.credit = credit;
    }
}