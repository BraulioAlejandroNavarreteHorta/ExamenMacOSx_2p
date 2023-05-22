//
//  CRUDComprasVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 18/05/23.
//

import Cocoa

class CRUDComprasVC: NSViewController {
    var usuarioRecibido:String?
    var usuario: String = ""
    var id :Int = 0
    var enviarAFlag: Bool = false
    var compraController = ComprasController.compartir
    var productosController = ProductosController.compartir
    var restaCantidad: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuario = usuarioRecibido!
        lblID.isHidden=true
        txtID.isHidden=true
        btnOK.isHidden=true
        btnEliminar.isHidden=true
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
            performSegue(withIdentifier: "actualizarCompra", sender: self)
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
            if(!compraController.compras.isEmpty){
                restaCantidad = productosController.productos[compraController.compras[Int(txtID.intValue)].idProducto].cantidad - compraController.compras[Int(txtID.intValue)].cantidad
                productosController.productos[compraController.compras[Int(txtID.intValue)].idProducto].cantidad = restaCantidad
                compraController.compras.remove(at: Int(txtID.intValue))
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
    
    
    @IBAction func funcBaja(_ sender: Any) {
        txtID.isHidden = false
        lblID.isHidden = false
        btnEliminar.isHidden = false
        btnOK.isHidden = true
    }
    
    
    
    @IBAction func Consulta(_ sender: Any) {
        performSegue(withIdentifier: "mostrar", sender: self)
    }
   
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "actualizarCompra"){
            let destinationVC = segue.destinationController as! ComprasProfileVC
            destinationVC.flag = enviarAFlag
            destinationVC.posicion = id
            destinationVC.usuarioRecibido = usuario
        }
        if(segue.identifier == "mostrar"){
            let destinationViewCont = segue.destinationController as! TablaCompra
            destinationViewCont.compras = compraController.compras
            destinationViewCont.prueba = "mensaje"
        }
        if(segue.identifier == "altaCompra"){
            let destinationVC = segue.destinationController as! ComprasProfileVC
            enviarAFlag = false
            destinationVC.flag = enviarAFlag
            destinationVC.posicion = id
            destinationVC.usuarioRecibido = usuario
        }
        
    }

    
    
    
    func alertaNoEliminar() -> Bool{
        let alert: NSAlert = NSAlert()
        alert.messageText = "El arreglo esta vacío, ingresa otra compra"
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    func alerta() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Compra eliminada"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    func agregarID(){
        if(!compraController.compras.isEmpty){
            for x in 0...compraController.compras.count-1{
                compraController.compras[x].id = x
            }
        }else{
            alertaNoEliminar()
        }
    }
    
    func validacionID() -> Bool {
        var estado = false
        if !compraController.compras.isEmpty{
            for x in 0 ... compraController.compras.count-1{
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
        alert.messageText = "No existe el ID, verifica en la lista de compras los ID"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    
}
