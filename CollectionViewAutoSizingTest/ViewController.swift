//
//  ViewController.swift
//  CollectionViewAutoSizingTest
//
//  Created by Wasin Wiwongsak on 1/25/17.
//  Copyright © 2017 Wasin Wiwongsak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
	
	let origString = "This is the initial text"
	let longString = "This will be longer text than it started with, and should wrap onto at least two lines."
	
	var origStringLen = 0
	var longStringLen = 0
	
	var randomTexts = [String]()
	
    let orandomTexts = ["Aenean dapibus urna a ullamcorper malesuada. Ut tempor.",
                       "Sed venenatis ligula massa, a vulputate ipsum fringilla eget. Ut justo erat, facilisis id rhoncus cursus, fringilla at.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis nibh metus, elementum tempus libero ornare vitae. Etiam sed leo pretium, consectetur turpis non, dapibus purus. Suspendisse potenti. Ut ut eros nunc. Cras nulla justo, porttitor non sapien at, iaculis.",
        "Maecenas pellentesque sed magna in congue. Sed non lacus in mi posuere scelerisque. Aenean.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus."]
	
	
	@IBAction func doChange(_ sender: Any) {
		
		let nCur = randomTexts[4].characters.count

		randomTexts[4] = nCur > origStringLen ?
			origString : longString
		
		collectionView.reloadData()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		randomTexts = [String](repeatElement(origString, count: 32))

		origStringLen = origString.characters.count
		longStringLen = longString.characters.count

        // Do any additional setup after loading the view, typically from a nib.
        collectionView.register(UINib.init(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
        }
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomTexts.count;
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.descriptionLabel.text = randomTexts[indexPath.row]
		cell.headerLabel.text = "Cell \(indexPath.row)"
		cell.widthConstraint.constant = randomTexts[indexPath.row].characters.count == origStringLen ? 160 : 280
        return cell
    }
    
}

