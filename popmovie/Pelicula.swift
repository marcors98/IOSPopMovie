//
//  Pelicula.swift
//  popmovie
//
//  Created by Alumno on 11/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Pelicula {
    
    var id : Int?
    var nombre : String?
    var genero : String?
    var año : String?
    var director : String?
    var trailer : String?
    var duracion : String?
    var elenco : String?
    var origen : String?
    var banner : String?
    var poster : String?
    
    init(id : Int?, nombre : String?, genero : String?, año : String?, director : String?, trailer : String?, duracion : String?,elenco : String?, origen : String?, banner : String?, poster : String?) {
        
        self.id = id
        self.nombre = nombre
        self.genero = genero
        self.año = año
        self.director = director
        self.trailer = trailer
        self.duracion = duracion
        self.elenco = elenco
        self.origen = origen
        self.banner = banner
        self.poster = poster
    }
    
    init(diccionario : NSDictionary) {
        self.id = 0
        if let id = diccionario.value(forKey: "id") as? Int {
            self.id = id
            print("id")
        }
        
        self.nombre = ""
        self.genero = ""
        self.año = ""
        self.director = ""
        self.trailer = ""
        self.duracion = ""
        self.elenco = ""
        self.origen = ""
        self.banner = ""
        self.poster = ""
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
            if let nombre = acf.value(forKey: "nobre") as? String{
                self.nombre = nombre
                print(self.nombre as Any)
            }
            if let genero = acf.value(forKey: "genero") as? String{
                self.genero = genero
            }
            if let año = acf.value(forKey: "año") as? String{
                self.año = año
            }
            if let director = acf.value(forKey: "director") as? String{
                self.director = director
            }
            if let trailer = acf.value(forKey: "trailer") as? String{
                self.trailer = trailer
            }
            if let duracion = acf.value(forKey: "duracion") as? String{
                self.duracion = duracion
            }
            if let elenco = acf.value(forKey: "elenco") as? String{
                self.elenco = elenco
            }
            if let origen = acf.value(forKey: "origen") as? String{
                self.origen = origen
            }
            if let banner = acf.value(forKey: "banner") as? String{
                self.banner = "http://popmovie.azurewebsites.net" + banner
            }
            if let poster = acf.value(forKey: "poster") as? String{
                self.poster = "http://popmovie.azurewebsites.net" + poster
            }
        }
    }
}
