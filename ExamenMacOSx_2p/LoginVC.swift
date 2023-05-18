//
//  LoginVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 13/05/23.
//

import Cocoa

class LoginVC: NSViewController {
    
    var id:Int = 0
    var enviarAFlag: Bool = false
    var loginController = LoginController.compartir
    
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
    
    @IBAction func cerrarSesion(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    @IBAction func crearUsuarioPorAdmin(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    
    @IBAction func actualizar(_ sender: Any) {
        //Oziel: Cambiar parametros para enviarlos
        id = Int(txtID.intValue)
        enviarAFlag = true
        performSegue(withIdentifier: "actualizarUsuario", sender: self)
        dismiss(self)
    }
    
    
    @IBAction func modificar(_ sender: Any) {
        txtID.isHidden = false
        lblID.isHidden = false
        btnOK.isHidden = false
        btnEliminar.isHidden = true
        
    }
    
    @IBAction func eliminar(_ sender: Any) {
        if(Int(txtID.intValue) == 0){
            alertaNoEliminar()
        }else{
            loginController.users.remove(at: Int(txtID.intValue))
            alerta()
            txtID.stringValue = ""
            agregarID()
        }
    }
    
    func agregarID(){
        for x in 0...loginController.users.count-1{
            loginController.users[x].id = x
        }
    }
    
    func alerta() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Usuario eliminado"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func alertaNoEliminar() -> Bool{
        let alert: NSAlert = NSAlert()
        alert.messageText = "No se puede eliminar al Usuario 0"
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
    //Oziel: Crear funcion prepare
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "actualizarUsuario"){
            let destinationVC = segue.destinationController as! AdminProfileVC
            destinationVC.flag = enviarAFlag
            destinationVC.posicion = id
        }
        
        
        if(segue.identifier == "mostrar"){
            let destinationViewCont = segue.destinationController as! Tabla
            destinationViewCont.users = loginController.users
            destinationViewCont.prueba = "mensaje"
        }
         
    }
    
    
    
}

