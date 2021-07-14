import UIKit

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
image.backgroundColor = UIColor.black
image.contentMode = .scaleAspectFit
view.addSubview(image)

let imageURL = URL(string: "https://www.raizlabs.com/dev/wp-content/uploads/sites/10/2016/12/Summary-3.png")

PlaygroundPage.current.liveView = view
func fetchImage(imageURL: URL?) {
  guard let imageURL = imageURL else { return }
  let queue = DispatchQueue.global(qos: .utility)
  queue.async{
    if let data = try? Data(contentsOf: imageURL) {
      DispatchQueue.main.async {
        image.image = UIImage(data: data)
      }
    }
  }
}
fetchImage(imageURL: imageURL)
