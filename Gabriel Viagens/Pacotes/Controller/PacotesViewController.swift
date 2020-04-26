//
//  PacotesViewController.swift
//  Gabriel Viagens
//
//  Created by Gabriel Sanzone on 26/04/20.
//  Copyright © 2020 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

class PacotesViewController: UIViewController {

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagem.dataSource = self
    }
}

extension PacotesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacotesViagemCollectionViewCell
        cell.backgroundColor = UIColor.blue
        return cell
    }
}
