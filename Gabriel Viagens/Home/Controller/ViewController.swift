//
//  ViewController.swift
//  Gabriel Viagens
//
//  Created by Gabriel Sanzone on 25/04/20.
//  Copyright © 2020 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var viewButtonHome: UIView!
    @IBOutlet weak var viewButtonPacotes: UIView!
    @IBOutlet weak var buttonHoteis: UIButton!
    @IBOutlet weak var buttonPacotes: UIButton!
    
    private var defaultRadius: CGFloat = 10
    let listaViagens = ViagemDAO.retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        setStyleForViewButton()
    }
    
    private func setStyleForViewButton(){
        viewButtonHome.layer.cornerRadius = defaultRadius
        viewButtonPacotes.layer.cornerRadius = defaultRadius
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "destinos", for: indexPath) as! DestinoTableViewCell
        let viagemAtual = listaViagens[indexPath.row]
        
        cell.lblTitulo.text = viagemAtual.titulo
        cell.qntDias.text = "\(viagemAtual.qntDias) Dias"
        cell.lblPreco.text = "R$ \(viagemAtual.preco)"
        cell.imagemDestino.image = UIImage(named: viagemAtual.urlImage)
        cell.imagemDestino.layer.cornerRadius = defaultRadius
        cell.imagemDestino.layer.masksToBounds = true
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
}

