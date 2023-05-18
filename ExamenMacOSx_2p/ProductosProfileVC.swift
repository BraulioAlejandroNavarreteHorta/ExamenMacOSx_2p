//
//  ProductosProfileVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 16/05/23.
//

import Cocoa

class ProductosProfileVC: NSViewController {
    var flag: Bool = false
    var posicion: Int?
    var productosController = ProductosController.compartir

    override func viewDidLoad() {
        super.viewDidLoad()
        txtID.isEnabled = false
        txtID.stringValue = String(productosController.productos.count)
        btnModificar.isHidden = !flag
        btnCrear.isHidden = flag
        
        if flag {
            txtID.integerValue = productosController.productos[posicion!].id
            txtNombre.stringValue = productosController.productos[posicion!].nombre
            txtDescripcion.stringValue = productosController.productos[posicion!].descripcion
            cmbUnidad.stringValue = productosController.productos[posicion!].unidad
            txtPrecio.doubleValue = productosController.productos[posicion!].precio
            txtCosto.doubleValue = productosController.productos[posicion!].costo
            cmbCategoria.stringValue = productosController.productos[posicion!].categoría
            txtCantidad.integerValue = productosController.productos[posicion!].cantidad
        }
    }
    
    @IBAction func addEvent(_ sender: NSButton) {
        //agregar validaciones
        productosController.productos.append(Product(txtNombre.stringValue, txtDescripcion.stringValue, cmbUnidad.stringValue, Double(txtPrecio.doubleValue), Double(txtCosto.doubleValue),cmbCategoria.stringValue, Int(txtCantidad.integerValue)))
        agregarID()
        print("Actualizado")
        self.view.window?.windowController?.close()
    }
    
    
    func agregarID(){
        for x in 0...productosController.productos.count-1{
            productosController.productos[x].id = x
        }
    }
    
    @IBAction func updateEvent(_ sender: NSButton) {
        //agregar validaciones
        productosController.productos[posicion!] = Product(txtNombre.stringValue, txtDescripcion.stringValue, cmbUnidad.stringValue, Double(txtPrecio.doubleValue), Double(txtCosto.doubleValue), cmbCategoria.stringValue, Int(txtCantidad.integerValue))
            
            print("Actualizado")
        self.view.window?.windowController?.close()
        }
        
    
    
    @IBOutlet weak var txtID: NSTextField!
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtDescripcion: NSTextField!
    @IBOutlet weak var cmbUnidad: NSComboBox!
    @IBOutlet weak var txtPrecio: NSTextField!
    @IBOutlet weak var txtCosto: NSTextField!
    @IBOutlet weak var cmbCategoria: NSComboBox!
    @IBOutlet weak var txtCantidad: NSTextField!
    
    
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    
}
