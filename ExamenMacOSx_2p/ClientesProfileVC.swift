//
//  ClientesProfileVC.swift
//  ExamenMacOSx_2p
//
//  Created by Adriana MV on 20/05/23.
//

import Cocoa

class ClientesProfileVC: NSViewController {

    var usuarioRecibido:String?
    var loginController = LoginController.compartir
    var ventasController = VentasController.compartir
    var PedidosController = pedidosController.compartir
    //var idProducto:Int = 0
    var idCliente:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        obtenerElIdClienteDelUsuarioRecibido()
        
        ventasController.addVenta(Venta(0, 0, "a", "b", "c", 120, "d", 10, "e", "f", "g", "h", "i", 0, "j", "k", "l", "m", "n", 1301, 16, 146))
        ventasController.addVenta(Venta(0, 0, "a", "b", "c", 120, "d", 10, "e", "f", "g", "h", "i", 1, "j", "k", "l", "m", "n", 1302, 16, 146))
        ventasController.addVenta(Venta(0, 0, "a", "b", "c", 120, "d", 10, "e", "f", "g", "h", "i", 1, "j", "k", "l", "m", "n", 1303, 16, 146))
        ventasController.addVenta(Venta(0, 0, "a", "b", "c", 120, "d", 10, "e", "f", "g", "h", "i", 1, "j", "k", "l", "m", "n", 1304, 16, 146))
    }
    
    @IBAction func viajarATablaProductos(_ sender: Any) {
        asignarVentasAlArregloPedidos()
        agregarIDaPedidos()
        performSegue(withIdentifier: "actualizarUsuario", sender: self)
    }
    
    func agregarIDaPedidos(){
        for x in 0...PedidosController.pedidos.count-1{
            PedidosController.pedidos[x].id = x
        }
    }
    
    func obtenerElIdClienteDelUsuarioRecibido(){
        for x in 0...loginController.users.count-1{
            if usuarioRecibido == loginController.users[x].username{
                idCliente = loginController.users[x].id
            }
        }
    }
    
    func asignarVentasAlArregloPedidos(){
        for x in 0...ventasController.ventas.count-1{
            if idCliente == ventasController.ventas[x].idCliente{
                PedidosController.addPedido(Pedidos(ventasController.ventas[x].idProducto, ventasController.ventas[x].nombreProducto, ventasController.ventas[x].descripcionProducto, ventasController.ventas[x].unidadProducto, ventasController.ventas[x].precioProducto, ventasController.ventas[x].total, ventasController.ventas[x].categoríaProducto, ventasController.ventas[x].cantidadProducto))
            }
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "irATablaPedidos"{
            
        }
    }
    
    @IBOutlet weak var lblMensajeBienvenida: NSTextField!
    @IBOutlet weak var btnConsultarPedidos: NSButton!
    @IBOutlet weak var btnSalir: NSButton!
}
