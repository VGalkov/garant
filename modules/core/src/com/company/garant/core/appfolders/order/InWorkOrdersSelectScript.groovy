/*
 * Copyright (c) 2024 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */
package com.company.garant.core.appfolders.order
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.UserSessionSource
import com.haulmont.thesis.core.appfolders.hazelcast.HazelcastCacheOperation


def userId = AppBeans.get(UserSessionSource.class).currentOrSubstitutedUserId()

HazelcastCacheOperation operation = AppBeans.get(HazelcastCacheOperation.class)
counterObject = operation.cardMetaClass('"garant$CreditOrder')
        .userInCurrentActors(userId)
        .processCodesAndStates(
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
                ]
        )
        .withHasCardInfoPredicate(userId)
        .submitToCount();

counterObject.folder = folder
style = (counterObject.cardInfoQuantity > 0) ? 'cardremind' : null

return counterObject.assignmentsQuantity
