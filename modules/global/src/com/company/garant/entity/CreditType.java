/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.entity;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Collection;
import java.util.List;

@Table(name = "GARANT_CREDIT_TYPE")
@Entity(name = "garant$CreditType")
@NamePattern("%s|name")
public class CreditType extends StandardEntity {
    private static final long serialVersionUID = 3134496440695643732L;

    @NotNull
    @Column(name = "CODE", nullable = false)
    protected String code;

    @NotNull
    @Column(name = "NAME", nullable = false)
    protected String name;

    @Lob
    @Column(name = "COMMENT_")
    protected String comment;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "creditType")
    private Collection<Credit> creditCollection;

    public Collection<Credit> getCreditCollection() {
        return creditCollection;
    }

    public void setCreditCollection(Collection<Credit> creditCollection) {
        this.creditCollection = creditCollection;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}