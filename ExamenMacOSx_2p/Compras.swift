//
//  Compras.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 18/05/23.
//

import Foundation

class Compra: NSObject{

    @objc dynamic var id:Int
    @objc dynamic var idProducto:Int
    @objc dynamic var cantidad:Int
    @objc dynamic var idComprador:Int
    
    init(_ id: Int, _ idProducto: Int, _ cantidad: Int, _ idComprador: Int) {
        self.id = id
        self.idProducto = idProducto
        self.cantidad = cantidad
        self.idComprador = idComprador
    }
    
}
