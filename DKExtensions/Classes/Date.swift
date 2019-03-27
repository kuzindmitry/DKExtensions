import UIKit

public extension Date {
    
    public func string(with format: String = "YYYY-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    // Components
    
    public func component(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    public var era: Int {
        return component(.era)
    }
    
    public var year: Int {
        return component(.year)
    }
    
    public var month: Int {
        return component(.month)
    }
    
    public var day: Int {
        return component(.day)
    }
    
    public var hours: Int {
        return component(.hour)
    }
    
    public var minutes: Int {
        return component(.minute)
    }
    
    public var seconds: Int {
        return component(.second)
    }
    
    public var nanoseconds: Int {
        return component(.nanosecond)
    }
    
    public var weekday: Int {
        return component(.weekday)
    }
    
    public var weekdayOrdinal: Int {
        return component(.weekdayOrdinal)
    }
    
    public var quarter: Int {
        return component(.quarter)
    }
    
    public var weekOfMonth: Int {
        return component(.weekOfMonth)
    }
    
    public var weekOfYear: Int {
        return component(.weekOfYear)
    }
    
    public var yearForWeekOfYear: Int {
        return component(.yearForWeekOfYear)
    }
    
    public var calendar: Int {
        return component(.calendar)
    }
    
    public var timeZone: Int {
        return component(.timeZone)
    }
    
    
    
    // Adding
    
    public func addYears(_ years: Int) -> Date {
        var comps = DateComponents()
        comps.year = years
        return Calendar.current.date(byAdding: comps, to: self) ?? self
    }
    
    public func addMonths(_ months: Int) -> Date {
        var comps = DateComponents()
        comps.month = months
        return Calendar.current.date(byAdding: comps, to: self) ?? self
    }
    
    
    public func addDays(_ days: Int) -> Date {
        var comps = DateComponents()
        comps.day = days
        return Calendar.current.date(byAdding: comps, to: self) ?? self
    }
    
    public func addHours(_ hours: Int) -> Date {
        var comps = DateComponents()
        comps.hour = hours
        return Calendar.current.date(byAdding: comps, to: self) ?? self
    }
    
    public func addMinutes(_ minutes: Int) -> Date {
        var comps = DateComponents()
        comps.minute = minutes
        return Calendar.current.date(byAdding: comps, to: self) ?? self
    }
    
    public func addSeconds(_ seconds: Int) -> Date {
        var comps = DateComponents()
        comps.second = seconds
        return Calendar.current.date(byAdding: comps, to: self) ?? self
    }
    
    public func addWeeks(_ weeks: Int) -> Date {
        var comps = DateComponents()
        comps.weekOfYear = weeks
        return Calendar.current.date(byAdding: comps, to: self) ?? self
    }
    
    public var startOfDay: Date {
        let components = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return Calendar.current.date(from: components) ?? self
    }
    
    public var startOfWeek: Date {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        let components = calendar.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
        return calendar.date(from: components) ?? self
    }
    
    public var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.month, .year], from: self)
        return Calendar.current.date(from: components) ?? self
    }
    
    public var startOfYear: Date {
        let components = Calendar.current.dateComponents([.year], from: self)
        return Calendar.current.date(from: components) ?? self
    }
    
    public var endOfDay: Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = 23
        components.minute = 59
        components.second = 59
        return Calendar.current.date(from: components) ?? self
    }
    
    public var endOfWeek: Date {
        var comps = DateComponents()
        comps.weekOfYear = 1
        comps.second = -1
        return Calendar.current.date(byAdding: comps, to: startOfWeek) ?? self
    }
    
    public var endOfMonth: Date {
        var comps = DateComponents()
        comps.month = 1
        comps.second = -1
        return Calendar.current.date(byAdding: comps, to: startOfMonth) ?? self
    }
    
    public var endOfYear: Date {
        var comps = DateComponents()
        comps.year = 1
        comps.second = -1
        return Calendar.current.date(byAdding: comps, to: startOfYear) ?? self
    }
 
    
    var utc: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy HH:mm:ss"
        dateFormatter.calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.string(from: self)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "dd MM yyyy HH:mm:ss"
        
        if let result = dateFormatter.date(from: dt) {
            return result
        }
        return self
    }
    
    var differenceTimestamp: Int64 {
        return self.timestamp - self.utcTimestamp
    }
    
    var utcTimestamp: Int64 {
        return Int64(utc.timeIntervalSince1970)
    }
    
    var timestamp: Int64 {
        return Int64(timeIntervalSince1970)
    }
    
}

