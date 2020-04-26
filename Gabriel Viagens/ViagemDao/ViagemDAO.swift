//
//  ViagemDAO.swift
//  Alura Viagens
//
//  Created by Ândriu Coelho on 04/08/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class ViagemDAO: NSObject {
    
    static func retornaTodasAsViagens() -> [Viagem] {
        let ceara = Viagem(titulo: "Ceará", qntDias: 3, preco: "1.800,59", urlImage: "img1.png")
        let rioDeJaneiro = Viagem(titulo: "Rio de Janeiro", qntDias: 6, preco: "1.200,00", urlImage: "img2.jpg")
        let interiorSaoPaulo = Viagem(titulo: "Atibaia - Sao Paulo", qntDias: 1, preco: "890,00", urlImage: "img3.jpg")
        let paraiba = Viagem(titulo: "Paraíba", qntDias: 3, preco: "1.385,00", urlImage: "img4.jpg")
        let fortaleza = Viagem(titulo: "Fortaleza", qntDias: 4, preco: "3.120,00", urlImage: "img5.jpg")
        let listaViagem = [rioDeJaneiro, ceara, interiorSaoPaulo, paraiba, fortaleza]
        
        return listaViagem
    }
}
