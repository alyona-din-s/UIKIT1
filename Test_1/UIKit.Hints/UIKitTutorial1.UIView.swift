//
//  UIKitTutorial1.UIView.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

import UIKit
import SnapKit


class UIKitTutorial1View: UIView{
 
    var subViewRect: UIView!
    var label: UILabel!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func customInit() {
        setupSubviews()
        setupConstraints()
        configureAppearance()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        // Called when the view is about to be added or removed from its superview
        if newSuperview != nil {
            // View is being added to a superview
        } else {
            // View is being removed from its superview
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Called when the view's bounds or constraints change
        // Perform layout-related tasks here, such as updating subview frames or constraints
        updateSubviewLayout()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Called to draw the view's content
        // Perform custom drawing here using Core Graphics or other drawing APIs
        drawCustomContent()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        // Called when the view has been added or removed from its superview
        if superview != nil {
            // View has been added to a superview
        } else {
            // View has been removed from its superview
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        // Called when the view has been added or removed from a window
        if window != nil {
            // View has been added to a window
        } else {
            // View has been removed from a window
        }
    }
    
    override func removeFromSuperview() {
        // Perform cleanup tasks here
        // Remove any observers, release resources, etc.
        
        super.removeFromSuperview()
    }
    
    //MARK: - Helper methods
    
    private func setupSubviews() {
        // Add and configure subviews here
    }
    
    private func setupConstraints() {
        // Add and activate constraints here
    }
    
    private func configureAppearance() {
        // Configure the view's appearance here
    }
    
    private func updateSubviewLayout() {
        // Update subview frames or constraints here
    }
    
    private func drawCustomContent() {
        // Perform custom drawing here
        drawRect(startColor: .yellow, endColor: .orange)

    }
     
 
    //MATK: - Samples
     
    
    func addGestureRecognizer(){
        guard self.isUserInteractionEnabled else { return }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapGesture))
        self.addGestureRecognizer(tapGesture)
    }
    
    func animateMe(){
        
        UIView.animate(withDuration: 0.5,
                   delay: 0,
                   options: .curveEaseIn,
                   animations: { () -> Void in
                    
            self.layer.opacity = 0
//                    self.superview?.layoutIfNeeded()
        }, completion: { (finished) -> Void in
            self.layer.opacity = 1
        })
    }
    
    func drawRect(startColor : UIColor, endColor: UIColor){
        
        let context = UIGraphicsGetCurrentContext()!
        let colors = [startColor.cgColor, endColor.cgColor]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)!
        
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: bounds.width, y: 0)
        context.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: [CGGradientDrawingOptions(rawValue: 0)])
    }
    
    @objc
    func onTapGesture(){
        self.backgroundColor = .red
    }
    
}
