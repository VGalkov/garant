/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.entity;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.annotation.EnableRestore;
import com.haulmont.cuba.core.entity.annotation.TrackEditScreenHistory;
import com.haulmont.thesis.core.entity.Contractor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Table(name = "GARANT_EXT_CONTRACTOR")
@DiscriminatorValue("J")
@Entity(name = "garant$ExtContractor")
@PrimaryKeyJoinColumn(name = "CONTRACTOR_ID", referencedColumnName = "ID")
@NamePattern("%s|name")
@EnableRestore
@TrackEditScreenHistory
public class ExtContractor extends Contractor {
    private static final long serialVersionUID = -8682640451441893110L;
}