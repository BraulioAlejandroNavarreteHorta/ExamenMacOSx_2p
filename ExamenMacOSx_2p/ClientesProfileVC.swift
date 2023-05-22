//
//  ClientesProfileVC.swift
//  ExamenMacOSx_2p
//
//  Created by Adriana MV on 20/05/23.
//

import Cocoa

class ClientesProfileVC: NSViewController {

    var usuarioRecibido:String?
    var mensaje:String?
    
    var loginController = LoginController.compartir
    var ventasController = VentasController.compartir
    var PedidosController = pedidosController.compartir
    //var idProducto:Int = 0
    
    var idCliente:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        lblMensajeBienvenida.stringValue = mensaje!
        
        obtenerElIdClienteDelUsuarioRecibido()
    }
    
    @IBAction func viajarATablaProductos(_ sender: Any) {
        asignarVentasAlArregloPedidos()
        agregarIDaPedidos()
        performSegue(withIdentifier: "irATablaPedidos", sender: self)
    }
    
    @IBAction func salirDeLaPagina(_ sender: Any) {
        self.view.window?.windowController?.close()
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
        PedidosController.pedidos.removeAll()
        for x in 0...ventasController.ventas.count-1{
            if idCliente == 0{
                PedidosController.addPedido(Pedidos(ventasController.ventas[x].idProducto, ventasController.ventas[x].nombreProducto, ventasController.ventas[x].descripcionProducto, ventasController.ventas[x].unidadProducto, ventasController.ventas[x].precioProducto, ventasController.ventas[x].total, ventasController.ventas[x].categoríaProducto, ventasController.ventas[x].cantidadVenta))
            }else{
                if idCliente == ventasController.ventas[x].idCliente{
                    PedidosController.addPedido(Pedidos(ventasController.ventas[x].idProducto, ventasController.ventas[x].nombreProducto, ventasController.ventas[x].descripcionProducto, ventasController.ventas[x].unidadProducto, ventasController.ventas[x].precioProducto, ventasController.ventas[x].total, ventasController.ventas[x].categoríaProducto, ventasController.ventas[x].cantidadVenta))
                }
            }
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "irATablaPedidos"{
            let destination = segue.destinationController as! TablaPedidosVC
            destination.pedidos = PedidosController.pedidos
        }
    }
    
    @IBOutlet weak var lblMensajeBienvenida: NSTextField!
    @IBOutlet weak var btnConsultarPedidos: NSButton!
    @IBOutlet weak var btnSalir: NSButton!
}
