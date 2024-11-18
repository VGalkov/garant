/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.entity;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.EmbeddableEntity;

import javax.persistence.*;

@Embeddable
@NamePattern("%s, %s, %s|city,house,street")
public class Address extends EmbeddableEntity {
    private static final long serialVersionUID = -4772273518229721348L;

    @Column(name = "CITY")
    protected String city;

    @Column(name = "HOUSE")
    protected String house;

    @Column(name = "STREET")
    protected String street;

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}