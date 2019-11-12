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
    
    /*init(diccionario : NSDictionary {
        self.id = 0
        if let id = diccionario.value
        })*/
}
