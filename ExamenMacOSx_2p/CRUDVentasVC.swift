//
//  CRUDVentasVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 21/05/23.
//

import Cocoa

class CRUDVentasVC: NSViewController {
    var usuarioRecibido:String?
    var usuario: String = ""
    var id :Int = 0
    var enviarAFlag: Bool = false
    var ventasController = VentasController.compartir
    var productosController = ProductosController.compartir
    var sumaCantidad: Int = 0
    //var restaCantidad: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        usuario = usuarioRecibido!
        lblID.isHidden=true
        txtID.isHidden=true
        btnOK.isHidden=true
        btnEliminar.isHidden=true
        // Do view setup here.
    }
    @IBOutlet weak var btnVolver: NSButton!
    @IBOutlet weak var txtID: NSTextField!
    @IBOutlet weak var btnAlta: NSButton!
    @IBOutlet weak var btnBaja: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var btnConsulta: NSButton!
    @IBOutlet weak var lblID: NSTextField!
    @IBOutlet weak var btnOK: NSButton!
    @IBOutlet weak var btnEliminar: NSButton!
    
    @IBAction func volver(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    @IBAction func altaCompra(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    
    @IBAction func actualizarCompra(_ sender: Any) {
        if validacionID(){
            id = Int(txtID.intValue)
            enviarAFlag = true
            performSegue(withIdentifier: "actualizarVenta", sender: self)
            dismiss(self)
        }else{
            alertaValidacion()
        }
        
        
    }

    
    @IBAction func modificar(_ sender: Any) {
        lblID.isHidden=false
        txtID.isHidden=false
        btnOK.isHidden=false
        btnEliminar.isHidden=true
    }
    
    
     @IBAction func eliminar(_ sender: Any) {
         if validacionID(){
             if(!ventasController.ventas.isEmpty){
                 sumaCantidad = productosController.productos[ventasController.ventas[Int(txtID.intValue)].idProducto].cantidad + ventasController.ventas[Int(txtID.intValue)].cantidadVenta
                 productosController.productos[ventasController.ventas[Int(txtID.intValue)].idProducto].cantidad = sumaCantidad
                 ventasController.ventas.remove(at: Int(txtID.intValue))
                 alerta()
                 txtID.stringValue = ""
                 agregarID()
                 
             }else{
                 alertaNoEliminar()
             }
         }else{
             alertaValidacion()
         }
         
         
     }
     
    /*
    
    @IBAction func Consulta(_ sender: Any) {
        performSegue(withIdentifier: "mostrar", sender: self)
    }
     */
    
    @IBAction func funcBaja(_ sender: Any) {
        txtID.isHidden = false
        lblID.isHidden = false
        btnEliminar.isHidden = false
        btnOK.isHidden = true
    }
    
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "actualizarVenta"){
            let destinationVC = segue.destinationController as! VentasProfileVC
            destinationVC.flag = enviarAFlag
            destinationVC.posicion = id
            destinationVC.usuarioRecibido = usuario
        }
        /*
        if(segue.identifier == "mostrar"){
            let destinationViewCont = segue.destinationController as! TablaCompra
            destinationViewCont.compras = compraController.compras
            destinationViewCont.prueba = "mensaje"
        }
         */
        if(segue.identifier == "altaVenta"){
            let destinationVC = segue.destinationController as! VentasProfileVC
            enviarAFlag = false
            destinationVC.flag = enviarAFlag
            destinationVC.posicion = id
            destinationVC.usuarioRecibido = usuario
        }
        
    }
    
    
    func alertaNoEliminar() -> Bool{
        let alert: NSAlert = NSAlert()
        alert.messageText = "El arreglo esta vacío, ingresa otra venta"
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    func alerta() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Venta eliminada"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    func agregarID(){
        if(!ventasController.ventas.isEmpty){
            for x in 0...ventasController.ventas.count-1{
                ventasController.ventas[x].idVenta = x
            }
        }else{
            alertaNoEliminar()
        }
    }
    
    func validacionID() -> Bool {
        var estado = false
        if !ventasController.ventas.isEmpty{
            for x in 0 ... ventasController.ventas.count-1{
                if(txtID.integerValue==x){
                    estado = true
                }
            }
        }else{
            estado = false
        }
        return estado
    }
    
    func alertaValidacion() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "No existe el ID, verifica en la lista de ventas los ID"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
}
