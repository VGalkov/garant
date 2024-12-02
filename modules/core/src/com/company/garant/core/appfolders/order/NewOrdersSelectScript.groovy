/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.garant.core.appfolders.order

import com.company.garant.entity.CreditOrder
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.UserSessionSource
import com.haulmont.thesis.core.appfolders.hazelcast.HazelcastCacheOperation
import com.haulmont.thesis.core.appfolders.predicates.ArchivePredicate
import com.haulmont.thesis.core.appfolders.predicates.MeetingDocStatusPredicate
import com.haulmont.thesis.core.appfolders.predicates.NotRegisteredDocPredicate
import com.haulmont.workflow.core.entity.Card
import com.hazelcast.query.Predicate
import com.hazelcast.query.Predicates

/**
 *
 * @author chekashkin* @version $Id$
 */

UUID userId = AppBeans.get(UserSessionSource.class).currentOrSubstitutedUserId()
List<Predicate> predicates = [
        new NotRegisteredDocPredicate(),
        Predicates.equal("substitutedCreatorId", userId),
        new ArchivePredicate(),
        new MeetingDocStatusPredicate(),
        Predicates.not(Predicates.instanceOf(CreditOrder.class))
]
HazelcastCacheOperation<Card> hazelcastCacheOperation = AppBeans.getPrototype(HazelcastCacheOperation.NAME);
return hazelcastCacheOperation.cacheName("CardNewCache")
        .withAdditionalPredicates(predicates)
        .select()