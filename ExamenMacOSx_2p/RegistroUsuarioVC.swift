//
//  RegistroUsuarioVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 13/05/23.
//

import Cocoa

class RegistroUsuarioVC: NSViewController {
    var mensaje : String = ""
    var loginController = LoginController.compartir
    var rol:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        txtId.isEnabled = false
        txtId.stringValue = String(loginController.users.count)
    }
    
    func registro (){
        loginController.addUser(User(txtUserName.stringValue, txtPassword.stringValue, txtNombre.stringValue, txtApellidoP.stringValue, txtApellidoM.stringValue, txtEmail.stringValue, txtTelefono.stringValue, txtGenero.stringValue, 0,calcularEdad(dateNacimiento),dateNacimiento.dateValue))
        agregarID()
            login()
    }
    
    func agregarID(){
        for x in 0...loginController.users.count-1{
            loginController.users[x].id = x
        }
    }
    
    
    func login() {
        let username = txtUserName.stringValue
        let password = txtPassword.stringValue
        
        let loginResult = loginController.login(username: username, password: password)
        
        if loginResult {
            if rol == nil{
                mensaje = "Bienvenido \(username) Rol no defenido aún"
            }else{
                mensaje = "Bienvenido \(username) \(rol!)"
            }
            
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        registro()
        if segue.identifier == "irAMenu" {
            let destination = segue.destinationController as! MenuVC
            destination.destinoMensage = mensaje
        }
    }
    
    @IBOutlet weak var txtUserName: NSTextField!
    @IBOutlet weak var txtPassword: NSTextField!
    @IBOutlet weak var txtConfirmarPassword: NSTextField!
    @IBOutlet weak var lblConfirmarPassword: NSTextField!
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoP: NSTextField!
    @IBOutlet weak var txtApellidoM: NSTextField!
    @IBOutlet weak var txtTelefono: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var txtGenero: NSTextField!
    @IBOutlet weak var dateNacimiento: NSDatePicker!
    
    func calcularEdad(_ datePicker: NSDatePicker) -> Int {
        let birthDate = datePicker.dateValue
        
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        let age = ageComponents.year!
        
        return age
    }
    
    @IBAction func checarContraseña(_ sender: NSButton) {
        if txtUserName.stringValue == "" || txtPassword.stringValue == "" || txtConfirmarPassword.stringValue == "" || txtNombre.stringValue == "" || txtApellidoP.stringValue == "" || txtApellidoM.stringValue == "" || txtTelefono.stringValue == "" || txtEmail.stringValue == "" || txtGenero.stringValue == "" || txtTelefono.stringValue.count != 10{
            txtUserName.placeholderString = "¡Falta llenar este campo!"
            txtPassword.placeholderString = "¡Falta llenar este campo!"
            txtConfirmarPassword.placeholderString = "¡Falta llenar este campo!"
            txtNombre.placeholderString = "¡Falta llenar este campo!"
            txtApellidoP.placeholderString = "¡Falta llenar este campo!"
            txtApellidoM.placeholderString = "¡Falta llenar este campo!"
            txtTelefono.stringValue = ""
            txtTelefono.placeholderString = "Llena el campo o pon 10 digitos"
            txtEmail.placeholderString = "¡Falta llenar este campo!"
            txtGenero.placeholderString = "¡Falta llenar este campo!"
        }else{
            if txtPassword.stringValue == txtConfirmarPassword.stringValue {
                performSegue(withIdentifier: "irALogin", sender: self)
                txtPassword.stringValue = ""
                txtUserName.stringValue = ""
                txtConfirmarPassword.stringValue = ""
                self.view.window?.windowController?.close()
            }else{
                lblConfirmarPassword.stringValue = "Contraseña incorrecta"
                
            }
        }
    }
    
}
