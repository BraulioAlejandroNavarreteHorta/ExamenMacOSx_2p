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
    
        
        
        
        
        
        
        
        
        
        if flag {
            //informacion del comprador
            lblNombreComprador.stringValue = comprasController.compras[posicion!].nombreUser
            lblApellidoPaternoComprador.stringValue = comprasController.compras[posicion!].apellidoP
            lblApellidoMaternoComprador.stringValue = comprasController.compras[posicion!].apellidoM
            lblCorreo.stringValue = comprasController.compras[posicion!].email
            lblTelefono.stringValue = comprasController.compras[posicion!].telefono
            //informacion del producto
            lblIDproducto.integerValue = comprasController.compras[posicion!].idProducto
            lblNombreProducto.stringValue = comprasController.compras[posicion!].nombre
            lblDescripcionProducto.stringValue = comprasController.compras[posicion!].descripcion
            lblUnidadProducto.stringValue = comprasController.compras[posicion!].unidad
            lblPrecioProducto.doubleValue = comprasController.compras[posicion!].precio
            lblCostoProducto.doubleValue = comprasController.compras[posicion!].costo
            lblCategoria.stringValue = comprasController.compras[posicion!].categoría
            lblExitenciaProducto.integerValue = comprasController.compras[posicion!].cantidadProducto
            //formulario
            txtIdProducto.integerValue = comprasController.compras[posicion!].idProducto
            txtCantidadCompra.integerValue = comprasController.compras[posicion!].cantidad
            txtIdComprador.integerValue = comprasController.compras[posicion!].idComprador
        }
        
        
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