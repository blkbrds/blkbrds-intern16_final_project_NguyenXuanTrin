//
//  SunandWindView.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/1/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class SunandWindView: UIView {

    // MARK: - Properties
    var pointX: CGFloat = -20
    var pointY: CGFloat = 142
    var viewModel: SunandWindTableViewModel?

    // MARK: - Functions
    func configSunsetSunrise(sunRise: String, sunSet: String) {
        let sunRiseLabel = UILabel(frame: CGRect(x: pointX, y: pointY, width: 100, height: 50))
        sunRiseLabel.text = sunRise
        sunRiseLabel.textAlignment = .center
        sunRiseLabel.textColor = .white
        addSubview(sunRiseLabel)

        let sunSetLabel = UILabel(frame: CGRect(x: pointX + 240, y: pointY, width: 100, height: 50))
        sunSetLabel.text = sunSet
        sunSetLabel.textAlignment = .center
        sunSetLabel.textColor = .white
        addSubview(sunSetLabel)
    }

    private func covertHourtoSecond(hours: String) -> Int {
        let temp: [String] = hours.components(separatedBy: ":")
        guard let temp1 = Int(temp[0]), let temp2 = Int(temp[1]) else {
            return 0
        }
        return (temp1 * 60) * 60 + temp2 * 60
    }

    func createADC() {
        let startAngle: CGFloat = CGFloat.pi
        let anglePI: CGFloat = 0.0
        let arrCenter: CGPoint = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)

        let adcLayer = CAShapeLayer()
        adcLayer.path = UIBezierPath(arcCenter: arrCenter,
            radius: 120,
            startAngle: startAngle,
            endAngle: anglePI,
            clockwise: true).cgPath
        adcLayer.lineWidth = 3.0
        adcLayer.strokeColor = UIColor.white.cgColor //border of circle
        adcLayer.fillColor = UIColor.clear.cgColor  //inside the circle
        adcLayer.lineJoin = .round
        adcLayer.lineDashPattern = [6, 3]
        layer.addSublayer(adcLayer)
    }

    func createLine(timecurrent: String, sunrise: String, sunset: String) {
        let startAngle: CGFloat = CGFloat.pi
        let secondCurrent: Int = covertHourtoSecond(hours: timecurrent)
        let secondSunset: Int = covertHourtoSecond(hours: sunset)
        let secondSunrise: Int = covertHourtoSecond(hours: sunrise)

        let anglePI: CGFloat = CGFloat(secondCurrent - secondSunrise) / CGFloat(secondSunset - secondSunrise)
        let arrCenter = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)

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
        animation.duration = 4
        //animation.repeatCount = .infinity
        animation.fromValue = 0
        return animation
    }
}


