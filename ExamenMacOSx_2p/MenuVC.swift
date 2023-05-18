//
//  MenuVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 16/05/23.
//

import Cocoa

class MenuVC: NSViewController {
    var destinoMensage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMensaje.stringValue = destinoMensage!
        validarMenu()
        
    }
    
    func validarMenu(){
        if destinoMensage!.contains("Admin"){
            btnUsuarios.isHidden = false
            btnVentas.isHidden = false
            btnCompras.isHidden = false
            btnClientes.isHidden = false
        }else{
            if destinoMensage!.contains("Cliente"){
                btnUsuarios.isHidden = true
                btnVentas.isHidden = true
                btnCompras.isHidden = true
                btnClientes.isHidden = false
            }else{
                if destinoMensage!.contains("Vendedor"){
                    btnVentas.isHidden = false
                    btnCompras.isHidden = true
                    btnUsuarios.isHidden = true
                    btnClientes.isHidden = true
                }else{
                    if destinoMensage!.contains("Compras"){
                        btnVentas.isHidden = true
                        btnCompras.isHidden = false
                        btnClientes.isHidden = true
                        btnUsuarios.isHidden = true
                    }
                    else{
                        btnUsuarios.isHidden = true
                        btnVentas.isHidden = true
                        btnCompras.isHidden = true
                        btnClientes.isHidden = true
                        btnCerrarSesion.title = "Volver"
                    }

                }
            }
            
        }
    }
    
    @IBAction func cerrarSesion(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
    
    
    @IBOutlet weak var lblMensaje: NSTextField!
    @IBOutlet weak var btnUsuarios: NSButton!
    @IBOutlet weak var btnVentas: NSButton!
    @IBOutlet weak var btnCompras: NSButton!
    @IBOutlet weak var btnClientes: NSButton!
    @IBOutlet weak var btnCerrarSesion: NSButton!
    
}
