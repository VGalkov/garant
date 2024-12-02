/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.core.appfolders.order
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.UserSessionSource
import com.haulmont.thesis.core.appfolders.AppFolderCardsSelector

def userId = AppBeans.get(UserSessionSource.class).currentOrSubstitutedUserId()

return AppFolderCardsSelector
        .get()
        .selectCardsByProcessAndState(
                'garant$CreditOrder',
                userId,
                ['OnlineCreditOrderProcess' : ['Proverka','Soglasovanie', 'Vydacha_kredita','Pogashenie_kredita']] as Map<String, List<String>>
        )
