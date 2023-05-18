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
    @IBOutlet weak var txtGenero: NSTextField!
    @IBOutlet weak var txtContraseña: NSTextField!
    @IBOutlet weak var txtRol: NSTextField!
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
        
        if txtTelefono.stringValue.count != 10 {
            txtTelefono.stringValue = ""
            txtTelefono.placeholderString = "Ingresa un número de 10 digitos"
        }
        else {
            loginController.users.append(User(txtUsuer.stringValue, txtContraseña.stringValue, txtNombre.stringValue, txtApellidoP.stringValue, txtApellidoM.stringValue, txtEmail.stringValue, txtTelefono.stringValue, txtGenero.stringValue, Int(txtRol.intValue), calcularEdad(dateNacimiento),dateNacimiento.dateValue))
            agregarID()
            print("Actualizado")
            self.view.window?.windowController?.close()
        }
        
        print(dateNacimiento.dateValue)
    }
    
    func agregarID(){
        for x in 0...loginController.users.count-1{
            loginController.users[x].id = x
        }
    }
    
    @IBAction func updateEvent(_ sender: NSButton) {
        if txtTelefono.stringValue.count != 10 {
            txtTelefono.stringValue = ""
            txtTelefono.placeholderString = "Ingresa un número de 10 digitos"
        } else {
            loginController.users[posicion!] = User(txtUsuer.stringValue, txtContraseña.stringValue, txtNombre.stringValue, txtApellidoP.stringValue, txtApellidoM.stringValue, txtEmail.stringValue, txtTelefono.stringValue, txtGenero.stringValue, Int(txtRol.intValue),calcularEdad(dateNacimiento), dateNacimiento.dateValue)
            
            print("Actualizado")
            dismiss(self)
        }
        
    }
    
    func calcularEdad(_ datePicker: NSDatePicker) -> Int {
        let birthDate = datePicker.dateValue
        
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        let age = ageComponents.year!
        
        return age
    }
    
}
