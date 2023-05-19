//
//  CRUDComprasVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 18/05/23.
//

import Cocoa

class CRUDComprasVC: NSViewController {
    var id :Int = 0
    var enviarAFlag: Bool = false
    var compraController = ComprasController.compartir
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    @IBAction func modificar(_ sender: Any) {
        lblID.isHidden=false
        txtID.isHidden=false
        btnOK.isHidden=false
        btnEliminar.isHidden=true
    }
    
    @IBAction func eliminar(_ sender: Any) {
        if(Int(txtID.intValue) < 1){
            alertaNoEliminar()
        }else{
            compraController.compras.remove(at: Int(txtID.intValue))
            alerta()
            txtID.stringValue = ""
            agregarID()
        }
    }
    
    
    @IBAction func funcBaja(_ sender: Any) {
        txtID.isHidden = false
        lblID.isHidden = false
        btnEliminar.isHidden = false
        btnOK.isHidden = true
    }
    
    
    
    @IBAction func Consulta(_ sender: Any) {
    }
   
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "actualizarCompra"){
            let destinationVC = segue.destinationController as! ComprasProfileVC
            destinationVC.flag = enviarAFlag
            destinationVC.posicion = id
        }
    }
        /*
     if(segue.identifier == "mostrar"){
         let destinationViewCont = segue.destinationController as! Tablap
         destinationViewCont.products = compraController.compras
         destinationViewCont.prueba = "mensaje"
     }
         
    }
     */
    
    
    
    func alertaNoEliminar() -> Bool{
        let alert: NSAlert = NSAlert()
        alert.messageText = "No existen ID menores a 1"
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    func alerta() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Producto eliminado"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    func agregarID(){
        for x in 0...compraController.compras.count-1{
            compraController.compras[x].id = x
        }
    }
    
    
}
