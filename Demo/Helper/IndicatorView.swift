
import UIKit
import NVActivityIndicatorView

class IndicatorView: NSObject {

    static func addIndicatorToView(View vw:UIView,heightOfIndecator:CGFloat=CGFloat(70), whithoutAnimation:Bool=false, color: UIColor? = .systemRed, indicatorType: NVActivityIndicatorType? = .circleStrokeSpin)
    {
        let vc:UIView? = vw

        if let v = vw.viewWithTag(9243)
        {
            vw.bringSubviewToFront(v)
            return
        }

        let viw = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: vc!.bounds.size))
        viw.tag = 9243
        viw.backgroundColor = .clear
        viw.alpha = 1
        let h:CGFloat = heightOfIndecator
        let size = CGSize.init(width: h, height: h)
        let point = CGPoint.init(x: (viw.frame.size.width-h)/2, y: (viw.frame.size.height-h)/2)
        let frm = CGRect.init(origin: point, size: size)
        let indicator = NVActivityIndicatorView.init(frame: frm, type: indicatorType, color: color, padding: nil)
        indicator.alpha = 1
        viw.addSubview(indicator)

        vc?.addSubview(viw)
        vc?.bringSubviewToFront(viw)
        if whithoutAnimation
        {
            indicator.startAnimating()
        }
        else
        {
            UIView.animate(withDuration: 0.25, animations: {
            }) { (status) in
                indicator.startAnimating()
            }
        }

    }
    
    static func removeIndicatiorView(View vc:UIView,completion:((Bool)->Void)?=nil)
    {
        DispatchQueue.main.async {
            var viw = vc.viewWithTag(9243)
            UIView.animate(withDuration: 0.25, animations: {
                viw?.alpha = 0
            }) { (status) in

                viw?.removeFromSuperview()
                viw = vc.viewWithTag(9243)
                completion?(true)
            }
        }
        
    }
}
