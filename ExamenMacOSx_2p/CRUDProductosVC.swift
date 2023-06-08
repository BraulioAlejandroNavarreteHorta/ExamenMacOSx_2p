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
    var usuarioRecibido:String?
    var color1:NSColor?
    var loginController = LoginController.compartir
    
    func asignarColor(_ color:String){
        switch color {
        case "verde":
            color1 = NSColor.green
        case "rojo":
            color1 = NSColor.red
        case "azul":
            color1 = NSColor.blue
        case "amarillo":
            color1 = NSColor.yellow
        case "naranja":
            color1 = NSColor.orange
        case "ninguno":
            color1 = NSColor.white
        default:
            break
        }
    }
    
    
    func setValue(){
        
        
        for x in 0...loginController.users.count-1{
            loginController.users[x].id = x
            
            if usuarioRecibido==loginController.users[x].username{
                img.image=NSImage(named: loginController.users[x].imagen)
                asignarColor(loginController.users[x].fondo)
                view.wantsLayer = true
                view.layer?.backgroundColor=color1?.cgColor
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblID.isHidden = true
        txtID.isHidden = true
        btnOK.isHidden = true
        btnEliminar.isHidden = true
        setValue()
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
    
    
    @IBOutlet weak var img: NSImageCell!
    
    
    
    @IBAction func volver(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    @IBAction func altaProducto(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    @IBAction func actualizarProducto(_ sender: Any) {
        if validacionID(){
            id = Int(txtID.intValue)
            enviarAFlag = true
            performSegue(withIdentifier: "actualizarProducto", sender: self)
            dismiss(self)
        }else{
            alertaValidacion()
        }
        
        
    }
    
    @IBAction func modificar(_ sender: Any) {
        txtID.isHidden = false
        lblID.isHidden = false
        btnOK.isHidden = false
        btnEliminar.isHidden = true
        
    }
    
    @IBAction func eliminar(_ sender: Any) {
        if validacionID(){
            productoController.productos.remove(at: Int(txtID.intValue))
            alerta()
            txtID.stringValue = ""
            agregarID()
        }else{
            alertaValidacion()
        }
        
    }
    
    func agregarID(){
        if(!productoController.productos.isEmpty){
            for x in 0...productoController.productos.count-1{
                productoController.productos[x].id = x
            }
        }else{
            alertaNoEliminar()
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
        alert.messageText = "El arreglo esta vacío, ingresa otro producto"
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
    
    func validacionID() -> Bool {
        var estado = false
        if !productoController.productos.isEmpty{
            for x in 0 ... productoController.productos.count-1{
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
        alert.messageText = "No existe el ID, verifica en la lista de productos los ID"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }

}
