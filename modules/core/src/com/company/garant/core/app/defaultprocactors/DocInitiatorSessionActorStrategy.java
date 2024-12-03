/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.core.app.defaultprocactors;

import com.haulmont.cuba.core.global.DataManager;
import com.haulmont.cuba.core.global.UserSessionSource;
import com.haulmont.cuba.core.global.View;
import com.haulmont.cuba.security.entity.User;
import com.haulmont.thesis.core.app.defaultprocactors.DefaultProcessActorAssignmentStrategy;
import com.haulmont.thesis.core.entity.defaultactor.TsDefaultProcActor;
import com.haulmont.workflow.core.entity.Card;
import org.springframework.stereotype.Component;

import javax.annotation.Nullable;
import javax.inject.Inject;

@Component(DocInitiatorSessionActorStrategy.NAME)
public class DocInitiatorSessionActorStrategy implements DefaultProcessActorAssignmentStrategy {
    @Inject
    protected DataManager dataManager;
    @Inject
    protected UserSessionSource userSessionSource;
    public static final String NAME = "garant_DocInitiatorSessionActorStrategy";
    @Override
    public String getId() {
        return NAME;
    }
    @Nullable
    @Override
    public User getUser(TsDefaultProcActor defaultProcActor, Card card) {
        return dataManager.load(User.class) //пользователь текущей сессии, а нужно автора карточки.
                .query("select u from sec$User u.id =:userId")
                .parameter("userId", userSessionSource.getUserSession().getUser().getId())
                .view(View.LOCAL)
                .one();
    }

    @Override
    public String getCaption() {
        return "Инициатор документов";
    }
}
