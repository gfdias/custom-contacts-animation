import UIKit

protocol CustomTransitionable where Self: UIViewController {
    var transitionView: UIView { get }
}

class DetailTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration: TimeInterval
    var isPresenting: Bool
    
    init(duration : TimeInterval, isPresenting : Bool) {
        self.duration = duration
        self.isPresenting = isPresenting
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from) as? CustomTransitionable,
            let toViewController = transitionContext.viewController(forKey: .to) as? CustomTransitionable
            else {
                return
        }
        
        self.isPresenting ?
            transitionContext.containerView.addSubview(toViewController.view) :
            transitionContext.containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
        
        let fromImageView = fromViewController.transitionView
        let transitionImageView = fromImageView.snapshotView(afterScreenUpdates: false)!
        let finalFromFrame = fromImageView.superview!.convert(fromImageView.frame, to: nil)
        
        transitionImageView.frame = finalFromFrame
        transitionContext.containerView.addSubview(transitionImageView)
        
        fromViewController.transitionView.alpha = 0.0
        toViewController.transitionView.alpha = 0.0
        
        toViewController.view.layoutIfNeeded()
        
        let finalToFrame = toViewController.transitionView.superview!.convert(toViewController.transitionView.frame, to: nil)
        
        if isPresenting {
            toViewController.view.transform = toViewController.view.transform.translatedBy(x: toViewController.view.bounds.width, y: 0)
        }
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0.0,
            options: [.calculationModeLinear],
            animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2/4, animations: {
                    transitionImageView.transform = transitionImageView.transform.scaledBy(x: 3.0, y: 3.0)
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4/4, animations: {
                    transitionImageView.frame = finalToFrame
                  
                    if !self.isPresenting {
                        fromViewController.view.transform = fromViewController.view.transform.translatedBy(x: fromViewController.view.bounds.width, y: 0)
                    } else {
                        toViewController.view.transform = .identity
                    }
                })
        },
            completion: { _ in
                fromViewController.transitionView.alpha = 1.0
                toViewController.transitionView.alpha = 1.0
                transitionImageView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
}
