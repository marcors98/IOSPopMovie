//
//  Serie.swift
//  popmovie
//
//  Created by G.A.P.M (Gabriel Pereda) on 11/26/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Serie {
    
    var id : Int?
    var nombre : String?
    var genero : String?
    var año : String?
    var productor : String?
    var trailer : String?
    var temporadas : String?
    var elenco : String?
    var origen : String?
    var banner : String?
    var poster : String?
    
    init(id : Int?, nombre : String?, genero : String?, año : String?, productor : String?, trailer : String?, temporadas : String?,elenco : String?, origen : String?, banner : String?, poster : String?) {
        
        self.id = id
        self.nombre = nombre
        self.genero = genero
        self.año = año
        self.productor = productor
        self.trailer = trailer
        self.temporadas = temporadas
        self.elenco = elenco
        self.origen = origen
        self.banner = banner
        self.poster = poster
    }
    
    init(diccionario : NSDictionary) {
        self.id = 0
        if let id = diccionario.value(forKey: "id") as? Int {
            self.id = id
        }
        
        self.nombre = ""
        self.genero = ""
        self.año = ""
        self.productor = ""
        self.trailer = ""
        self.temporadas = ""
        self.elenco = ""
        self.origen = ""
        self.banner = ""
        self.poster = ""
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
            if let nombre = acf.value(forKey: "nombre") as? String{
                self.nombre = nombre
            }
            if let genero = acf.value(forKey: "genero") as? String{
                self.genero = genero
            }
            if let año = acf.value(forKey: "ano") as? String{
                self.año = año
            }
            if let director = acf.value(forKey: "productor") as? String{
                self.productor = director
            }
            if let trailer = acf.value(forKey: "trailer") as? String{
                self.trailer = trailer
            }
            if let duracion = acf.value(forKey: "temporadas") as? String{
                self.temporadas = duracion
            }
            if let elenco = acf.value(forKey: "elenco") as? String{
                self.elenco = elenco
            }
            if let origen = acf.value(forKey: "pais_origen") as? String{
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

