//
//  TrackingData.swift
//  Challengo
//
//  Created by Aurélien on 28/06/2024.
//

import SwiftUI

/// Tableau des challenges accomplis avec leur catégorie, date et statut.
let trackingChallenges: [TrackingChallenge] = [
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-02T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-03T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-04T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-05T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-06T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-07T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-01-08T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-09T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-10T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-11T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-01-12T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-13T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-14T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-15T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-01-16T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-01-17T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-18T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-01-19T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-20T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-21T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-22T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-23T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-24T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-25T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-01-26T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-01-27T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-28T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-29T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-01-30T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-31T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-02-01T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-02T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-03T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-04T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-02-05T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-02-06T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-07T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-08T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-09T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-10T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-11T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-12T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-13T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-02-14T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-15T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-16T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-02-17T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-18T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-19T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-20T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-02-21T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-22T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-23T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-24T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-25T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-26T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-27T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-02-28T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-29T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-03-01T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-02T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-03T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-04T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-05T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-03-06T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-03-07T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-08T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-09T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-10T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-03-11T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-12T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-03-13T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-14T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-15T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-16T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-17T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-03-18T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-19T00-00", status: .succeeded),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-20T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-21T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-22T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-23T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-24T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-25T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-26T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-03-27T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-28T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-29T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-30T00-00", status: .succeeded),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-31T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-04-01T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-04-02T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-04-03T00-00", status: .succeeded),
    TrackingChallenge(category: .selfResponsibility, date: "2024-04-04T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-04-05T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-04-06T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-04-07T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-04-08T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-04-09T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-04-10T00-00", status: .succeeded)]

/// Génère le tableau représentant le nombre de challenges réussis et échoués par mois.
let winFailChallengeDatas = TrackingTools.buildWinFailChallengeData(trackingChallenges: trackingChallenges)

/// Génère le tableau représentant le nombre de challenges accomplis par catégorie.
let balanceChallengeCat = TrackingTools.buildBalanceChallengeCat(trackingChallenges: trackingChallenges)




