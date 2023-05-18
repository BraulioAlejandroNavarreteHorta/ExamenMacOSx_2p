//
//  User.swift
//  ExamenMacOSx_2p
//
//  Created by Braulio Alejandro Navarrete Horta on 13/05/23.
//

import Foundation

class User: NSObject{
    @objc dynamic var username:String
    @objc dynamic var password:String
    @objc dynamic var id:Int
    @objc dynamic var nombre:String
    @objc dynamic var apellidoP:String
    @objc dynamic var apellidoM:String
    @objc dynamic var email:String
    @objc dynamic var telefono:String
    @objc dynamic var genero:String
    @objc dynamic var role:Int
    @objc dynamic var edad:Int
    @objc dynamic var fechaNacimiento:Date
    
    
    init(_ username: String,_ password: String,_ nombre: String,_ apellidoP: String,_ apellidoM: String,_ email: String,_ telefono: String,_ genero: String,_ role: Int,_ edad: Int,_ fechaNacimiento: Date) {
        self.username = username
        self.password = password
        self.id = 0
        self.nombre = nombre
        self.apellidoP = apellidoP
        self.apellidoM = apellidoM
        self.email = email
        self.telefono = telefono
        self.genero = genero
        self.role = role
        self.edad = edad
        self.fechaNacimiento = fechaNacimiento
    }
}
