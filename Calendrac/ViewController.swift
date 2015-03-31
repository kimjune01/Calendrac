//
//  ViewController.swift
//  Calendrac
//
//  Created by Camvy Films on 2015-03-31.
//  Copyright (c) 2015 June. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.mainScreen().bounds.width
let screenHeight = UIScreen.mainScreen().bounds.height

class ViewController: UIViewController {

  var menuMonthsView:JTCalendarMenuView!
  var contentView:JTCalendarContentView!
  var calendar:JTCalendar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCalendar()
    customizeCalendar()
    refreshCalendar()
  }
  
  func setupCalendar() {
    calendar = JTCalendar()
    calendar.dataSource = self
    let menuViewHeight = screenHeight/10
    menuMonthsView = JTCalendarMenuView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: menuViewHeight))
    view.addSubview(menuMonthsView)
    contentView = JTCalendarContentView(frame: CGRect(x: 0, y: menuViewHeight, width: screenWidth, height: screenHeight/2))
    view.addSubview(contentView)
    
  }
  
  func customizeCalendar() {
    calendar.calendarAppearance.calendar().firstWeekday = 1 //Sunday
    calendar.calendarAppearance.ratioContentMenu = 0.5
    calendar.calendarAppearance.menuMonthTextColor = UIColor.darkGrayColor()

    calendar.calendarAppearance.dayCircleColorToday = UIColor.lightGrayColor()
    calendar.calendarAppearance.dayCircleColorTodayOtherMonth = UIColor.lightGrayColor()
    
    calendar.calendarAppearance.dayCircleColorSelected = UIColor.blueColor()
    calendar.calendarAppearance.dayCircleColorSelectedOtherMonth = UIColor.blueColor()
    
    calendar.calendarAppearance.dayDotColor = UIColor.darkGrayColor()
    calendar.calendarAppearance.dayDotColorSelected = UIColor.blackColor()
    calendar.calendarAppearance.dayDotRatio = 0.3
    
    calendar.calendarAppearance.dayTextColorSelected = UIColor.grayColor()
    
  }
  
  func refreshCalendar() {
    calendar.menuMonthsView = menuMonthsView
    calendar.contentView = contentView
    calendar.reloadData()
    calendar.reloadAppearance()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController: JTCalendarDataSource {
  func calendar(calendar: JTCalendar!, canSelectDate date: NSDate!) -> Bool {
    //
    return true
  }
  
  func calendarDidDateSelected(calendar: JTCalendar!, date: NSDate!) {
    println("calendarDidDateSelected calendar:\(calendar) date: \(date)")
  }
  
  func calendarDidLoadNextPage() {
    println("calendarDidLoadNextPage")
  }
  
  func calendarDidLoadPreviousPage() {
    println("calendarDidLoadPreviousPage")
  }
  
  func calendarHaveEvent(calendar: JTCalendar!, date: NSDate!) -> Bool {
    //
    return true
  }
}

