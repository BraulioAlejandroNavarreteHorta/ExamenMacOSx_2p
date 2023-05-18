//
//  CRUDProductosVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 16/05/23.
//

import Cocoa

class CRUDProductosVC: NSViewController {

    var id:Int = 0
    var enviarAFlag: Bool = false
    var productoController = ProductosController.compartir
    override func viewDidLoad() {
        super.viewDidLoad()
        lblID.isHidden = true
        txtID.isHidden = true
        btnOK.isHidden = true
        btnEliminar.isHidden = true
    }
    
    @IBOutlet weak var lblMensage: NSTextField!
    @IBOutlet weak var btnCerrarSesion: NSButton!
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
    
    @IBAction func altaProducto(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    @IBAction func actualizarProducto(_ sender: Any) {
        id = Int(txtID.intValue)
        enviarAFlag = true
        performSegue(withIdentifier: "actualizarProducto", sender: self)
        dismiss(self)
    }
    
    @IBAction func modificar(_ sender: Any) {
        txtID.isHidden = false
        lblID.isHidden = false
        btnOK.isHidden = false
        btnEliminar.isHidden = true
        
    }
    
    @IBAction func eliminar(_ sender: Any) {
        if(Int(txtID.intValue) < 1){
            alertaNoEliminar()
        }else{
            productoController.productos.remove(at: Int(txtID.intValue))
            alerta()
            txtID.stringValue = ""
            agregarID()
        }
    }
    
    func agregarID(){
        for x in 0...productoController.productos.count-1{
            productoController.productos[x].id = x
        }
    }
    
    func alerta() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Producto eliminado"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func alertaNoEliminar() -> Bool{
        let alert: NSAlert = NSAlert()
        alert.messageText = "No existen ID menores a 1"
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    @IBAction func funcionEliminar(_ sender: Any) {
        txtID.isHidden = false
        lblID.isHidden = false
        btnEliminar.isHidden = false
        btnOK.isHidden = true
        
    }
    
    @IBAction func mostrarTabla(_ sender: Any) {
        performSegue(withIdentifier: "mostrar", sender: self)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "actualizarProducto"){
            let destinationVC = segue.destinationController as! ProductosProfileVC
            destinationVC.flag = enviarAFlag
            destinationVC.posicion = id
        }
        
        
        if(segue.identifier == "mostrar"){
            let destinationViewCont = segue.destinationController as! Tablap
            destinationViewCont.products = productoController.productos
            destinationViewCont.prueba = "mensaje"
        }
         
         
    }

}
