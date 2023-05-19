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
    var loginController = LoginController.compartir
    var productosController = ProductosController.compartir
    var sumaCantidades:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnModificar.isHidden = !flag
        btnCrear.isHidden = flag
        if flag {
            //informacion del comprador
            lblNombreComprador.stringValue = comprasController.compras[posicion!].username
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
    
    
    @IBAction func alta(_ sender: Any) {
        comprasController.compras.append(Compra(Int(txtIdProducto.integerValue),Int(txtCantidadCompra.integerValue),txtIdComprador.integerValue,lblNombreProducto.stringValue,lblDescripcionProducto.stringValue,lblUnidadProducto.stringValue,Double(lblPrecioProducto.doubleValue),Double(lblCostoProducto.doubleValue),lblCategoria.stringValue,lblExitenciaProducto.integerValue,lblNombreComprador.stringValue,lblApellidoPaternoComprador.stringValue,lblApellidoMaternoComprador.stringValue,lblCorreo.stringValue,lblTelefono.stringValue))
        agregarID()
        print("se hizo la alta")
        self.view.window?.windowController?.close()
    }
    
    
    @IBAction func btnAplicarCambios(_ sender: Any) {
        //Informacion del producto
        setProducto()
        setInfoComprador()
     
    }
    
    
    @IBAction func Actualizar(_ sender: Any) {
        //sale paro en debug checar mañana
        comprasController.compras[posicion!] = Compra(Int(txtIdProducto.integerValue),Int(txtCantidadCompra.integerValue),txtIdComprador.integerValue,lblNombreProducto.stringValue,lblDescripcionProducto.stringValue,lblUnidadProducto.stringValue,Double(lblPrecioProducto.doubleValue),Double(lblCostoProducto.doubleValue),lblCategoria.stringValue,lblExitenciaProducto.integerValue,lblNombreComprador.stringValue,lblApellidoPaternoComprador.stringValue,lblApellidoMaternoComprador.stringValue,lblCorreo.stringValue,lblTelefono.stringValue)
        print("actualizacion de compra")
        self.view.window?.windowController?.close()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func setProducto(){
        for x in 0 ... productosController.productos.count-1{
            if(txtIdProducto.integerValue==x){
                lblIDproducto.stringValue = " \(productosController.productos[x].id)"
                lblNombreProducto.stringValue = productosController.productos[x].nombre
                lblDescripcionProducto.stringValue = productosController.productos[x].descripcion
                lblUnidadProducto.stringValue = productosController.productos[x].unidad
                lblPrecioProducto.stringValue = "\(productosController.productos[x].precio)"
                lblCostoProducto.stringValue = "\(productosController.productos[x].costo)"
                lblCategoria.stringValue = productosController.productos[x].categoría
                sumaCantidades=txtCantidadCompra.integerValue + productosController.productos[x].cantidad
                productosController.productos[x].cantidad = sumaCantidades
                lblExitenciaProducto.stringValue = "\(sumaCantidades)"
                
            }
        }
    }
    
    func setInfoComprador(){
        for x in 0 ...
        loginController.users.count-1{
            if(txtIdComprador.integerValue==x){
                lblNombreComprador.stringValue = loginController.users[x].nombre
                lblApellidoPaternoComprador.stringValue = loginController.users[x].apellidoP
                lblApellidoMaternoComprador.stringValue = loginController.users[x].apellidoM
                lblCorreo.stringValue = loginController.users[x].email
                lblTelefono.stringValue = "\(loginController.users[x].telefono)"
            }
        }
    }
   
    
    func agregarID(){
        for x in 0...comprasController.compras.count-1{
            comprasController.compras[x].id = x
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
