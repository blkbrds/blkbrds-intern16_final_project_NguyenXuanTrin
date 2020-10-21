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
        let temps: [String] = hours.components(separatedBy: ":")
        let index = temps[1].index(temps[1].startIndex, offsetBy: 2)
        let mySubstringTemp1 = temps[1][..<index]
        guard let temp1 = Int(temps[0]), let temp2 = Int(mySubstringTemp1) else {
            return 0
        }
        return (temp1 * 60) * 60 + temp2 * 60
    }

    private func covertSunsettoSecond(hours: String) -> Int {
        let temps: [String] = hours.components(separatedBy: ":")
        let index = temps[1].index(temps[1].startIndex, offsetBy: 2)
        let mySubstringTemp1 = temps[1][..<index]
        guard let temp1 = Int(temps[0]), let temp2 = Int(mySubstringTemp1) else {
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

        let imageView = UIImageView(image: #imageLiteral(resourceName: "img_sun"))
        imageView.frame = CGRect(x: 0,
            y: 220 / 2.0 - 20,
            width: 40,
            height: 40)
        imageView.translatesAutoresizingMaskIntoConstraints = false

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
        let circlePath = UIBezierPath(arcCenter: arrCenter,
                                      radius: 120,
                                      startAngle: startAngle,
                                      endAngle: anglePI * .pi + startAngle,
                                      clockwise: true).cgPath
        circleLayer.path = circlePath
        circleLayer.lineWidth = 3.0
        circleLayer.strokeColor = UIColor.yellow.cgColor //border of circle
        circleLayer.fillColor = UIColor.clear.cgColor //inside the circle
        circleLayer.lineJoin = .round
        circleLayer.lineDashPattern = [6, 3]
        circleLayer.strokeStart = 0
        layer.addSublayer(circleLayer)
        addSubview(imageView)
        circleLayer.add(configAnimations(startAngle: startAngle, anglePI: anglePI), forKey: nil)

        //Add the animation to the layer of the image view
        imageView.layer.add(configAnimationforImage(circlePath: circlePath), forKey: nil)

        //prevent the imageView from going back to its original coordinates
        imageView.frame.origin.x = circlePath.currentPoint.x - imageView.frame.width / 2
        imageView.frame.origin.y = circlePath.currentPoint.y - imageView.frame.height / 2
    }

    func configAnimations(startAngle: CGFloat, anglePI: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = (anglePI * .pi + startAngle) / .pi
        switch anglePI {
        case 1:
            animation.duration = 6.2
        case 0.9..<1:
            animation.duration = 5.7
        case 0.8..<0.9:
            animation.duration = 5.2
        case 0.75..<0.8:
            animation.duration = 4.6
        case 0.7..<0.75:
            animation.duration = 4.17
        case 0.65..<0.7:
            animation.duration = 3.8
        case 0.6..<0.65:
            animation.duration = 3.4
        case 0.55..<0.6:
            animation.duration = 3
        default:
            animation.duration = 4.2
        }
        return animation
    }

    func configAnimationforImage(circlePath: CGPath) -> CAKeyframeAnimation {
        let imageAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        imageAnimation.duration = 3
        imageAnimation.path = circlePath
        return imageAnimation
    }
    
    func configImage() {
            let bigPole2X = UIImageView(image: UIImage(named: "bigpole2x"))
            bigPole2X.frame = CGRect(x: 160,
                                     y: 220 - 105,
                                     width: 8,
                                     height: 45)
            let blade2X = UIImageView(image: UIImage(named: "blade_big2x"))
            blade2X.frame = CGRect(x: 140,
                                   y: 220 - 135,
                                   width: 50,
                                   height: 50)
            let bigPole3X = UIImageView(image: UIImage(named: "bigpole3x"))
            bigPole3X.frame = CGRect(x: 120,
                                     y: 220 - 120,
                                     width: 10,
                                     height: 60)
            let blade3X = UIImageView(image: UIImage(named: "blade_big3x"))
            blade3X.frame = CGRect(x: 95,
                                   y: 220 - 155,
                                   width: 60,
                                   height: 60)
    //        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
    //            blade2X.transform = blade2X.transform.rotated(by: CGFloat.pi / 360)
    //            blade3X.transform = blade3X.transform.rotated(by: CGFloat.pi / 360)
    //        }
            addSubviews([bigPole3X,blade3X,bigPole2X,blade2X])
        }
}
