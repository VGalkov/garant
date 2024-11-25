/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.web.ui.extcontractor;

import com.haulmont.cuba.gui.components.Component;
import com.haulmont.thesis.web.ui.contractor.ContractorLookup;
import org.dom4j.Attribute;
import org.dom4j.Element;

public class ExtContractorLookup extends ContractorLookup {

    @Override
    protected void initLookupComponentDescriptor() {
        Element element = ((Component.HasXmlDescriptor) getFrame()).getXmlDescriptor();
        Attribute attribute = element.attribute("lookupComponent");
        String value = companyTable.getId();

        switch (tabsheet.getSelectedTab().getName()) {
            case "companyTab":
                value = "companyTable";
                break;
            case "individualTab":
                value = "individualTable";
                break;
            case "extContractorTab":
                value = "extContractorTable";
                break;
        }

        if (attribute == null)
            element.addAttribute("lookupComponent", value);
        else
            attribute.setValue(value);
    }
}