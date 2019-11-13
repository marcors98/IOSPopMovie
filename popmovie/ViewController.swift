//
//  ViewController.swift
//  popmovie
//
//  Created by Alumno on 11/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var peliculas : [Pelicula] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://popmovie.azurewebsites.net/wp-json/wp/v2/peliculas").responseJSON{
            response in
            switch(response.result)
            {
            case .success(let datos) : if let arregloEvenntos = datos as? NSArray {
                for evento in arregloEvenntos{
                    if let diccionarioEvento = evento as? NSDictionary
                    {
                        let nuevoElemento = Pelicula(diccionario : diccionarioEvento)
                        self.peliculas.append(nuevoElemento)
                    }
                }
                
                self.tvNombreEvento.reloadData()
                }
            case .failure(_) : print("Algo salio mal")
                
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaPelicula") as? celdaPeliculaController
        
        celda?.lblPelicula.text = peliculas[indexPath.row].nombre
        celda?.lblGenero.text = peliculas[indexPath.row].genero
        
        return celda!
    }

}

