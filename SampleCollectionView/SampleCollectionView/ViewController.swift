
import UIKit


let reuseIdentifier = "CellIdentifier";

private let sectionInsets = UIEdgeInsets(top: 50.0,
left: 20.0,
bottom: 50.0,
right: 20.0)

private let itemsPerRow : CGFloat = 3

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
        
//        flowLayout.itemSize = CGSize(width: 350, height: 100)
//        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as UICollectionViewCell
            cell.backgroundColor = self.randomColor()
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (1 + itemsPerRow)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        print("collv widht is \(collectionView.frame.width)")
        
        print("widht is \(widthPerItem)")
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }


    

    //UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {

        return sectionInsets.left;
    }


    //UICollectionViewDatasource methods


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 1500
    }
    
    
    
  
    

    // custom function to generate a random UIColor
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    
}
