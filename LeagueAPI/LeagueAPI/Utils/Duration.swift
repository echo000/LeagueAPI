//
//  Duration.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/18/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Duration: Equatable, Comparable {
    
    private let millisecondsPerSecond: Double = 1000
    private let millisecondsPerMinute: Double = 1000 * 60
    private let millisecondsPerHour: Double = 1000 * 60 * 60
    private let millisecondsPerDay: Double = 1000 * 60 * 60 * 24
    
    public private(set) var durationMilliseconds: Double
    
    public var durationSeconds: Double {
        return self.durationMilliseconds / millisecondsPerSecond
    }
    
    public var durationMinutes: Double {
        return self.durationMilliseconds / millisecondsPerMinute
    }
    
    public var durationHours: Double {
        return self.durationMilliseconds / millisecondsPerHour
    }
    
    public var durationDays: Double {
        return self.durationMilliseconds / millisecondsPerDay
    }
    
    public var milliseconds: Double {
        return self.durationMilliseconds.remainder(dividingBy: millisecondsPerSecond)
    }
    
    public var seconds: Double {
        return duration(between: millisecondsPerSecond, and: millisecondsPerMinute)
    }
    
    public var minutes: Double {
        return duration(between: millisecondsPerMinute, and: millisecondsPerHour)
    }
    
    public var hours: Double {
        return duration(between: millisecondsPerHour, and: millisecondsPerDay)
    }
    
    public var days: Double {
        return (self.durationMilliseconds / millisecondsPerDay).rounded()
    }
    
    public init(milliseconds: Double) {
        self.durationMilliseconds = milliseconds
    }
    
    public init(seconds: Double) {
        self.durationMilliseconds = seconds * millisecondsPerSecond
    }
    
    public init(minutes: Double) {
        self.durationMilliseconds = minutes * millisecondsPerMinute
    }
    
    public init(hours: Double) {
        self.durationMilliseconds = hours * millisecondsPerHour
    }
    
    public init(days: Double) {
        self.durationMilliseconds = days * millisecondsPerDay
    }
    
    public func toString() -> String {
        let dayStr: String = unitToString(self.days, unitName: "day", happen: " ")
        let hourStr: String = unitToString(self.hours, unitName: "hour", happen: " ")
        let minuteStr: String = unitToString(self.minutes, unitName: "minute", happen: " ")
        let secondStr: String = unitToString(self.seconds, unitName: "second", happen: " ")
        let millisecondStr: String = unitToString(self.milliseconds, unitName: "millisecond")
        return "\(dayStr)\(hourStr)\(minuteStr)\(secondStr)\(millisecondStr)"
    }
    
    public static func ==(lhs: Duration, rhs: Duration) -> Bool {
        return lhs.durationMilliseconds == rhs.durationMilliseconds
    }
    
    public static func <(lhs: Duration, rhs: Duration) -> Bool {
        return lhs.durationMilliseconds < rhs.durationMilliseconds
    }
    
    private func unitToString(_ value: Double, unitName: String, happen: String = "") -> String {
        if value > 0 {
            return "\(value < 10 ? "0" : "")\(Long(value)) \(unitName)\(value == 1 ? "" : "s")\(happen)"
        }
        else {
            return ""
        }
    }
    
    private func duration(between millisecondsPerUnitLower: Double, and millisecondsPerUnitGreater: Double) -> Double {
        let under: Double = self.durationMilliseconds.remainder(dividingBy: millisecondsPerUnitGreater)
        let precise: Double = under / millisecondsPerUnitLower
        return precise.rounded()
    }
}
