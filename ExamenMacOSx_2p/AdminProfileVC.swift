//
//  AdminProfileVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 13/05/23.
//

import Cocoa

class AdminProfileVC: NSViewController {
    var flag: Bool = false
    var posicion: Int?
    var loginController = LoginController.compartir
    
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoP: NSTextField!
    @IBOutlet weak var txtApellidoM: NSTextField!
    @IBOutlet weak var txtUsuer: NSTextField!
    @IBOutlet weak var txtTelefono: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var txtGenero: NSComboBox!    
    @IBOutlet weak var txtContraseña: NSSecureTextField!
    @IBOutlet weak var txtRol: NSComboBox!
    @IBOutlet weak var dateNacimiento: NSDatePicker!
    
    
    @IBOutlet weak var btnCreate: NSButton!
    @IBOutlet weak var btnUpdate: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtId.isEnabled = false
        txtId.stringValue = String(loginController.users.count)
        btnUpdate.isHidden = !flag
        btnCreate.isHidden = flag
        
        if flag {
            txtId.integerValue = loginController.users[posicion!].id
            txtNombre.stringValue = loginController.users[posicion!].nombre
            txtApellidoP.stringValue =    loginController.users[posicion!].apellidoP
           
            txtApellidoM.stringValue  = loginController.users[posicion!].apellidoM
            
            txtUsuer.stringValue  = loginController.users[posicion!].username
            
            
            txtTelefono.stringValue  = loginController.users[posicion!].telefono
            
            
            txtEmail.stringValue  = loginController.users[posicion!].email
            
            
            txtGenero.stringValue  = loginController.users[posicion!].genero
            
            
            txtContraseña.stringValue  = loginController.users[posicion!].password
            
            txtRol.integerValue = loginController.users[posicion!].role
            
            dateNacimiento.dateValue = loginController.users[posicion!].fechaNacimiento
        }
    }
    @IBAction func addEvent(_ sender: NSButton) {
        
        if validacionDeCampos() {
            loginController.users.append(User(txtUsuer.stringValue, txtContraseña.stringValue, txtNombre.stringValue, txtApellidoP.stringValue, txtApellidoM.stringValue, txtEmail.stringValue, txtTelefono.stringValue, txtGenero.stringValue, Int(txtRol.intValue), calcularEdad(dateNacimiento),dateNacimiento.dateValue))
            agregarID()
            print("Actualizado")
            self.view.window?.windowController?.close()
        }
        else {
            alerta()
        }
        
        print(dateNacimiento.dateValue)
    }
    
    func agregarID(){
        for x in 0...loginController.users.count-1{
            loginController.users[x].id = x
        }
    }
    
    @IBAction func updateEvent(_ sender: NSButton) {
        if validacionDeCampos() {
            loginController.users[posicion!] = User(txtUsuer.stringValue, txtContraseña.stringValue, txtNombre.stringValue, txtApellidoP.stringValue, txtApellidoM.stringValue, txtEmail.stringValue, txtTelefono.stringValue, txtGenero.stringValue, Int(txtRol.intValue),calcularEdad(dateNacimiento), dateNacimiento.dateValue)
            agregarID()
            print("Actualizado")
            dismiss(self)
        } else {
            alerta()
        }
        
    }
    
    func calcularEdad(_ datePicker: NSDatePicker) -> Int {
        let birthDate = datePicker.dateValue
        
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        let age = ageComponents.year!
        
        return age
    }
    
    func validacionDeCampos() -> Bool{
        var estado = false
        if txtUsuer.stringValue == "" || txtContraseña.stringValue == "" || txtNombre.stringValue == "" || txtApellidoP.stringValue == "" || txtApellidoM.stringValue == "" || txtTelefono.stringValue == "" || txtEmail.stringValue == "" || txtGenero.stringValue == "" || txtRol.stringValue == "" || txtNombre.stringValue.range(of: "[0-9]", options: .regularExpression) != nil || txtApellidoP.stringValue.range(of: "[0-9]", options: .regularExpression) != nil || txtApellidoM.stringValue.range(of: "[0-9]", options: .regularExpression) != nil || !txtEmail.stringValue.contains("@") || txtContraseña.stringValue.count < 8 || txtTelefono.stringValue.count != 10 || txtTelefono.stringValue.range(of: "[a-z]", options: .regularExpression) != nil{
        }
        else{
            estado = true
        }
        return estado
    }
    
    func alerta() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Verifica los campos, puede que tengas errores"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
}
