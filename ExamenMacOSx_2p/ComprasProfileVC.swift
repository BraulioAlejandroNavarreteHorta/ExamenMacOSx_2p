//
//  ComprasProfileVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 18/05/23.
//

import Cocoa

class ComprasProfileVC: NSViewController {
    var flag: Bool = false
    var posicion: Int?
    var comprasController = ComprasController.compartir

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    //Información del comprador
    @IBOutlet weak var lblNombreComprador: NSTextField!
    @IBOutlet weak var lblApellidoPaternoComprador: NSTextField!
    @IBOutlet weak var lblApellidoMaternoComprador: NSTextField!
    @IBOutlet weak var lblCorreo: NSTextField!
    
    @IBOutlet weak var lblTelefono: NSTextField!
    
    //Información del producto
    @IBOutlet weak var lblIDproducto: NSTextField!
    @IBOutlet weak var lblNombreProducto: NSTextField!
    @IBOutlet weak var lblDescripcionProducto: NSTextField!
    @IBOutlet weak var lblUnidadProducto: NSTextField!
    @IBOutlet weak var lblPrecioProducto: NSTextField!
    @IBOutlet weak var lblCostoProducto: NSTextField!
    @IBOutlet weak var lblCategoria: NSTextField!
    @IBOutlet weak var lblExitenciaProducto: NSTextField!
    
    
    //formulario
    
    @IBOutlet weak var txtIdProducto: NSTextField!
    @IBOutlet weak var txtCantidadCompra: NSTextField!
    @IBOutlet weak var txtIdComprador: NSTextField!
    @IBOutlet weak var btnSubmit: NSButton!
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    
}
