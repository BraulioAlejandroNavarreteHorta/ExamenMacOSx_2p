//
//  VentasProfileVC.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 21/05/23.
//

import Cocoa

class VentasProfileVC: NSViewController {
    var usuarioRecibido:String?
    var usuario: String = ""
    var flag: Bool = false
    var posicion: Int?
    var ventasController = VentasController.compartir
    var loginController = LoginController.compartir
    var productosController = ProductosController.compartir
    var restaExistencia:Int = 0
    var precioUnitario:Double = 0
    var subtotal:Double = 0
    var IVA:Double = 0
    var total:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuario = usuarioRecibido!
        btnCrear.isEnabled = false
        btnModificar.isEnabled = false
        lblUsuario.stringValue = usuario
        txtIDVenta.isEnabled = false
        txtIDVendedor.isEnabled = false
        txtIDVenta.stringValue = String(ventasController.ventas.count)
        btnModificar.isHidden = !flag
        btnCrear.isHidden = flag
        txtIDVendedor.integerValue = identificarIdVendedor(lblUsuario)
        
        if flag {
            //informacion del vendedor
            lblNombreVendedor.stringValue = ventasController.ventas[posicion!].nombreVendedor
            lblApellidoPaternoVendedor.stringValue = ventasController.ventas[posicion!].apellidoPVendedor
            lblApellidoMaternoVendedor.stringValue = ventasController.ventas[posicion!].apellidoMVendedor
            lblCorreoVendedor.stringValue = ventasController.ventas[posicion!].emailVendedor
            lblTelefonoVendedor.stringValue = ventasController.ventas[posicion!].telefonoVendedor
            
            //informacion del cliente
            lblIDCliente.integerValue = ventasController.ventas[posicion!].idCliente
            lblNombreCliente.stringValue = ventasController.ventas[posicion!].nombreCliente
            lblApellidoPaternoCliente.stringValue = ventasController.ventas[posicion!].apellidoPCliente
            lblApellidoMaternoCliente.stringValue = ventasController.ventas[posicion!].apellidoMCliente
            lblCorreoCliente.stringValue = ventasController.ventas[posicion!].correoCliente
            lblTelefonoCliente.stringValue = ventasController.ventas[posicion!].telefonoCliente
            
            //informacion de la venta
            lblCantidad.integerValue = ventasController.ventas[posicion!].cantidadVenta
            lblUnidad.stringValue = ventasController.ventas[posicion!].unidadProducto
            lblProducto.stringValue = ventasController.ventas[posicion!].nombreProducto
            lblDescripcion.stringValue = ventasController.ventas[posicion!].descripcionProducto
            lblPrecio.doubleValue = ventasController.ventas[posicion!].precioProducto
            lblSubtotal.doubleValue = ventasController.ventas[posicion!].subtotal
            lblIVA.doubleValue = ventasController.ventas[posicion!].IVA
            lblTotal.doubleValue = ventasController.ventas[posicion!].total
            //formulario
            txtIDVenta.integerValue = ventasController.ventas[posicion!].idVenta
            txtIDProducto.integerValue = ventasController.ventas[posicion!].idProducto
            txtIDCliente.integerValue = ventasController.ventas[posicion!].idCliente
            txtCantidadVenta.integerValue = ventasController.ventas[posicion!].cantidadVenta
        }
        // Do view setup here.
    }
    
    
    func restarExistencia() -> Bool{
        
        var alta = false
        for x in 0 ... productosController.productos.count-1{
            if txtCantidadVenta.integerValue <= productosController.productos[x].cantidad{
                restaExistencia=productosController.productos[x].cantidad - txtCantidadVenta.integerValue
                productosController.productos[x].cantidad = restaExistencia
            alertaInventario()
                alta = true
            }
            else{
                alta = false
            }
        }
        return alta
    }
    @IBAction func alta(_ sender: Any) {
        
        if !productosController.productos.isEmpty{
            
            if restarExistencia() {
                ventasController.ventas.append(Venta(Int(txtIDProducto.integerValue),lblProducto.stringValue,lblDescripcion.stringValue,lblUnidad.stringValue,Double(lblPrecio.doubleValue),productosController.productos[Int(txtIDProducto.integerValue)].categoría,Int(lblCantidad.integerValue),lblNombreVendedor.stringValue,lblApellidoPaternoVendedor.stringValue,lblApellidoMaternoVendedor.stringValue,lblCorreoVendedor.stringValue,lblTelefonoVendedor.stringValue,Int(lblIDCliente.integerValue),lblNombreCliente.stringValue,lblApellidoPaternoCliente.stringValue,lblApellidoMaternoCliente.stringValue,lblCorreoCliente.stringValue,lblTelefonoCliente.stringValue,Double(lblSubtotal.doubleValue),Double(lblIVA.doubleValue),Double(lblTotal.doubleValue)))
                agregarID()
                print("se hizo la alta")
                self.view.window?.windowController?.close()
            }else{
                alertaInventarioInsuficiente()
            }
        }else{
            noExisteElProducto()
        }
    }
    
    @IBAction func Actualizar(_ sender: Any) {
        
        if !productosController.productos.isEmpty{
            
            if restarExistencia() {
                ventasController.ventas[posicion!] = Venta(Int(txtIDProducto.integerValue),lblProducto.stringValue,lblDescripcion.stringValue,lblUnidad.stringValue,Double(lblPrecio.doubleValue),productosController.productos[Int(txtIDProducto.integerValue)].categoría,Int(lblCantidad.integerValue),lblNombreVendedor.stringValue,lblApellidoPaternoVendedor.stringValue,lblApellidoMaternoVendedor.stringValue,lblCorreoVendedor.stringValue,lblTelefonoVendedor.stringValue,Int(lblIDCliente.integerValue),lblNombreCliente.stringValue,lblApellidoPaternoCliente.stringValue,lblApellidoMaternoCliente.stringValue,lblCorreoCliente.stringValue,lblTelefonoCliente.stringValue,Double(lblSubtotal.doubleValue),Double(lblIVA.doubleValue),Double(lblTotal.doubleValue))
                print("actualizacion de compra")
                self.view.window?.windowController?.close()
            }else{
                alertaInventarioInsuficiente()
            }
        }else{
            noExisteElProducto()
        }
       
    }
    
    @IBAction func btnAplicarCambios(_ sender: Any) {
        //Informacion del producto
        setProducto()
        btnCrear.isEnabled = true
        btnModificar.isEnabled = true
    }
    
    
    
    @IBOutlet weak var lblUsuario: NSTextField!
    
    //TXT'S
    @IBOutlet weak var txtIDVenta: NSTextField!
    @IBOutlet weak var txtIDProducto: NSTextField!
    @IBOutlet weak var txtIDCliente: NSTextField!
    @IBOutlet weak var txtCantidadVenta: NSTextField!
    @IBOutlet weak var txtIDVendedor: NSTextField!
    
    
    //Información vendedor
    @IBOutlet weak var lblNombreVendedor: NSTextField!
    @IBOutlet weak var lblApellidoPaternoVendedor: NSTextField!
    @IBOutlet weak var lblApellidoMaternoVendedor: NSTextField!
    @IBOutlet weak var lblCorreoVendedor: NSTextField!
    @IBOutlet weak var lblTelefonoVendedor: NSTextField!
    
    //Información cliente
    @IBOutlet weak var lblIDCliente: NSTextField!
    @IBOutlet weak var lblNombreCliente: NSTextField!
    @IBOutlet weak var lblApellidoPaternoCliente: NSTextField!
    @IBOutlet weak var lblApellidoMaternoCliente: NSTextField!
    @IBOutlet weak var lblCorreoCliente: NSTextField!
    @IBOutlet weak var lblTelefonoCliente: NSTextField!
    
    //Información venta
    @IBOutlet weak var lblCantidad: NSTextField!
    @IBOutlet weak var lblUnidad: NSTextField!
    @IBOutlet weak var lblProducto: NSTextField!
    @IBOutlet weak var lblDescripcion: NSTextField!
    @IBOutlet weak var lblPrecio: NSTextField!
    @IBOutlet weak var lblSubtotal: NSTextField!
    @IBOutlet weak var lblIVA: NSTextField!
    @IBOutlet weak var lblTotal: NSTextField!
    
    //Botones
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    
    func setProducto(){
        
        if !productosController.productos.isEmpty {
            for x in 0 ... productosController.productos.count-1{
                if(txtIDProducto.integerValue==x){
                    
                    if txtCantidadVenta.integerValue <= productosController.productos[x].cantidad {
                        lblCantidad.stringValue = txtCantidadVenta.stringValue
                        lblUnidad.stringValue = " \(productosController.productos[x].unidad)"
                        lblProducto.stringValue = productosController.productos[x].nombre
                        lblDescripcion.stringValue = productosController.productos[x].descripcion
                        lblPrecio.stringValue = "\(productosController.productos[x].precio)"
                        subtotal = lblCantidad.doubleValue * lblPrecio.doubleValue
                        IVA = subtotal * 0.16
                        total = subtotal + IVA
                        lblSubtotal.stringValue = String(subtotal)
                        lblIVA.stringValue = String(IVA)
                        lblTotal.stringValue = String(total)
                        alertaInventario()
                        setInfoCliente()
                        setInfoVendedor()
                    }
                    else{
                        alertaInventarioInsuficiente()
                    }
                }else{
                    noExisteElProducto()
                }
                
            }
        }else{
            noExisteElProducto()
        }
    }
    
    func setInfoVendedor(){
        for x in 0 ...
        loginController.users.count-1{
            if(txtIDVendedor.integerValue==x){
                lblNombreVendedor.stringValue = loginController.users[x].nombre
                lblApellidoPaternoVendedor.stringValue = loginController.users[x].apellidoP
                lblApellidoMaternoVendedor.stringValue = loginController.users[x].apellidoM
                lblCorreoVendedor.stringValue = loginController.users[x].email
                lblTelefonoVendedor.stringValue = "\(loginController.users[x].telefono)"
            }
        }
    }
    
    func noExisteElProducto() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "No existe un producto con este ID, consulta la lista de los productos"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func alertaInventarioInsuficiente() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "La existencia de este producto es \(productosController.productos[txtIDProducto.integerValue].cantidad), avisa al comprador que pida más para completar la venta u ofrecele al cliente la existencia"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func alertaInventario() -> Bool {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Queda \(productosController.productos[txtIDProducto.integerValue].cantidad) de \(lblProducto.stringValue)"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func setInfoCliente(){
        for x in 0 ...
        loginController.users.count-1{
            if(txtIDCliente.integerValue==x){
                lblIDCliente.integerValue = loginController.users[x].id
                lblNombreCliente.stringValue = loginController.users[x].nombre
                lblApellidoPaternoCliente.stringValue = loginController.users[x].apellidoP
                lblApellidoMaternoCliente.stringValue = loginController.users[x].apellidoM
                lblCorreoCliente.stringValue = loginController.users[x].email
                lblTelefonoCliente.stringValue = "\(loginController.users[x].telefono)"
            }
        }
    }
    
    func identificarIdVendedor(_ usuario: NSTextField) -> Int {
        var idVendedor = 0
        for x in 0...loginController.users.count-1{
            if usuario.stringValue == loginController.users[x].username {
                idVendedor = x
            }
        }
        return idVendedor
    }
    
    func agregarID(){
        for x in 0...ventasController.ventas.count-1{
            ventasController.ventas[x].idVenta = x
        }
    }
    
}