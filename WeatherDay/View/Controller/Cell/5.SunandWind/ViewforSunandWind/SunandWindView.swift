//
//  SunandWindView.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/1/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class SunandWindView: UIView {

    // MARK: - Functions
    func configSunsetSunrise(sunRise: String, sunSet: String) {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let sunRiseLabel = UILabel(frame: CGRect(x: screenWidth / 2 - 220, y: 220 / 1.5 - 10, width: 100, height: 50))
        sunRiseLabel.text = sunRise
        sunRiseLabel.textAlignment = .center
        sunRiseLabel.textColor = .white
        addSubview(sunRiseLabel)

        let sunSetLabel = UILabel(frame: CGRect(x: screenWidth / 2 + 20, y: 220 / 1.5 - 10, width: 100, height: 50))
        sunSetLabel.text = sunSet
        sunSetLabel.textAlignment = .center
        sunSetLabel.textColor = .white
        addSubview(sunSetLabel)
    }
    
    private func covertSunrisetoSecond(hours: String) -> Int {
        let temp: [String] = hours.components(separatedBy: ":")
        let index = temp[1].index(temp[1].startIndex, offsetBy: 2)
        let mySubstringTemp1 = temp[1][..<index]
        guard let temp1 = Int(temp[0]), let temp2 = Int(mySubstringTemp1) else {
            return 0
        }
        return (temp1 * 60) * 60 + temp2 * 60
    }

    private func covertSunsettoSecond(hours: String) -> Int {
        let temp: [String] = hours.components(separatedBy: ":")
        let index = temp[1].index(temp[1].startIndex, offsetBy: 2)
        let mySubstringTemp1 = temp[1][..<index]
        guard let temp1 = Int(temp[0]), let temp2 = Int(mySubstringTemp1) else {
            return 0
        }
        return ((temp1 + 12) * 60) * 60 + temp2 * 60
    }

    func createADC() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let startAngle: CGFloat = CGFloat.pi
        let anglePI: CGFloat = 0.0
        let arrCenter = CGPoint(x: screenWidth / 2 - 60, y: 220 / 1.5)

        let adcLayer = CAShapeLayer()
        adcLayer.path = UIBezierPath(arcCenter: arrCenter,
            radius: 120,
            startAngle: startAngle,
            endAngle: anglePI,
            clockwise: true).cgPath
        adcLayer.lineWidth = 3.0
        adcLayer.strokeColor = UIColor.white.cgColor //border of circle
        adcLayer.fillColor = UIColor.clear.cgColor //inside the circle
        adcLayer.lineJoin = .round
        adcLayer.lineDashPattern = [6, 3]
        layer.addSublayer(adcLayer)
    }

    func createLine(hoursCurrent: Int, minuteCurrent: Int, sunrise: String, sunset: String) {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let startAngle: CGFloat = CGFloat.pi
        let secondCurrent: Int = (hoursCurrent * 60) * 60 + minuteCurrent * 60
        let secondSunrise: Int = covertSunrisetoSecond(hours: sunrise)
        let secondSunset: Int = covertSunsettoSecond(hours: sunset)

        var anglePI: CGFloat = CGFloat(secondCurrent - secondSunrise) / CGFloat(secondSunset - secondSunrise)
        if anglePI >= 1 {
            anglePI = 1
        }
        let arrCenter = CGPoint(x: screenWidth / 2 - 60, y: 220 / 1.5)

        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(arcCenter: arrCenter,
            radius: 120,
            startAngle: startAngle,
            endAngle: anglePI * .pi + startAngle,
            clockwise: true).cgPath
        circleLayer.lineWidth = 3.0
        circleLayer.strokeColor = UIColor.yellow.cgColor //border of circle
        circleLayer.fillColor = UIColor.clear.cgColor //inside the circle
        circleLayer.lineJoin = .round
        circleLayer.lineDashPattern = [6, 3]
        circleLayer.strokeStart = 0
        layer.addSublayer(circleLayer)
        circleLayer.add(configAnimations(startAngle: startAngle, anglePI: anglePI), forKey: nil)
    }

    func configAnimations(startAngle: CGFloat, anglePI: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = (anglePI * .pi + startAngle) / .pi
        animation.duration = 5
        //animation.repeatCount = .infinity
        animation.fromValue = 0
        return animation
    }
}


