//
//  PacotesViewController.swift
//  Gabriel Viagens
//
//  Created by Gabriel Sanzone on 26/04/20.
//  Copyright © 2020 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

class PacotesViewController: UIViewController {

    @IBOutlet weak var pesquisaViagens: UISearchBar!
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    var listaViagens = ViagemDAO.retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisaViagens.delegate = self
    }
}

extension PacotesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacotesViagemCollectionViewCell
        let viagemAtual = listaViagens[indexPath.row]
        cell.imagem.image = UIImage(named:viagemAtual.urlImage)
        cell.titulo.text = viagemAtual.titulo
        cell.qntDias.text = "\(viagemAtual.qntDias) Dias"
        cell.preco.text = "R$ \(viagemAtual.preco)"
    
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        cell.layer.cornerRadius = 8
        return cell
    }
}

extension PacotesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        //Pega a largura toda da collectionView e divide por dois (para ter duas por tela)
        //Tira 10 para considerar a distancia entre elas
        let width = (collectionView.bounds.width / 2) - 10
        return CGSize(width: width, height: 160)
    }
}

extension PacotesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
        let nsListaViagem = listaViagens as NSArray
        nsListaViagem.filtered(using: filtroListaViagem)
        //let listaFiltrada: [Viagem] = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! [Viagem]
        listaViagens = nsListaViagem as! [Viagem]
        colecaoPacotesViagem.reloadData()
        
    }
    
}
