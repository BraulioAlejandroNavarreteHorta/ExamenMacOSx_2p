//
//  Pedidos.swift
//  ExamenMacOSx_2p
//
//  Created by Adriana MV on 20/05/23.
//

import Foundation

class Pedidos: NSObject{
    @objc dynamic var id:Int
    @objc dynamic var idProducto:Int
    @objc dynamic var nombreProducto:String //
    @objc dynamic var descripcionProducto:String //
    @objc dynamic var unidadProducto:String //
    @objc dynamic var precioProducto:Double //
    @objc dynamic var costoProducto:Double //
    @objc dynamic var categoríaProducto:String //
    @objc dynamic var cantidadPedidaProducto:Int
    
    init(_ idProducto: Int,_ nombreProducto: String,_ descripcionProducto: String,_ unidadProducto: String,_ precioProducto: Double,_ costoProducto: Double,_ categoríaProducto: String,_ cantidadPedidaProducto: Int) {
        self.id = 0
        self.idProducto = idProducto
        self.nombreProducto = nombreProducto
        self.descripcionProducto = descripcionProducto
        self.unidadProducto = unidadProducto
        self.precioProducto = precioProducto
        self.costoProducto = costoProducto
        self.categoríaProducto = categoríaProducto
        self.cantidadPedidaProducto = cantidadPedidaProducto
    }
}
