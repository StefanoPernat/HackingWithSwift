import UIKit

let vw = UIView()

// simple closure
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})


// trailing closure
UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
