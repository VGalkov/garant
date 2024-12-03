/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.core.app.defaultprocactors;

import com.haulmont.cuba.core.global.DataManager;
import com.haulmont.cuba.core.global.View;
import com.haulmont.cuba.security.entity.User;
import com.haulmont.thesis.core.app.defaultprocactors.DefaultProcessActorAssignmentStrategy;
import com.haulmont.thesis.core.entity.defaultactor.TsDefaultProcActor;
import com.haulmont.workflow.core.entity.Card;
import org.springframework.stereotype.Component;

import javax.annotation.Nullable;
import javax.inject.Inject;

@Component(OperatorActorStrategy.NAME)
public class OperatorActorStrategy implements DefaultProcessActorAssignmentStrategy {
    public static final String NAME = "garant_OperatorActorStrategy";
    @Inject
    protected DataManager dataManager;
    @Override
    public String getId() {
        return NAME;
    }
    @Nullable
    @Override
    public User getUser(TsDefaultProcActor defaultProcessActor, Card card) {
        return dataManager.load(User.class)
                .query("select u from sec$User u join u.userRoles ur where ur.role.name =:nameRole")
                .parameter("nameRole", "Operator")
                .view(View.LOCAL)
                .one();
    }

    @Override
    public String getCaption() {
        return "Оператор";
    }
}
