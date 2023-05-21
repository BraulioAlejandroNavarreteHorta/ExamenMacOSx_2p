//
//  OpcionesCompradorVC.swift
//  ExamenMacOSx_2p
//
//  Created by Moises Hernandez Alvarado on 18/05/23.
//

import Cocoa

class OpcionesCompradorVC: NSViewController {
    var usuarioRecibido:String?
    var usuario: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        usuario = usuarioRecibido!
        // Do view setup here.
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {

        if segue.identifier == "compras" {
            let destination = segue.destinationController as! CRUDComprasVC
            destination.usuarioRecibido = usuario
        }
    }
    
}
