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
                ['OnlineCreditOrderProcess' : [
                                'Ne_soglasovano_uridicheskoi_sluzhboi',
                                'Soglasovanie',
                                'Parallelnoe_naznachenie3',
                                'Vydacha_kredita',
                                'Proverka_pogasheniya',
                                'Uvedomlenie_SB',
                                'Proverka',
                                'Ne_soglasovano_bankom',
                                'Proverka_SB',
                                'Ne_soglasovano_SB',
                                'Proverka_zayavki_ne_proidena',
                                'Pogashenie_kredita'
                        ]
                ] as Map<String, List<String>>
        )
