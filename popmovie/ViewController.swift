//
//  ViewController.swift
//  popmovie
//
//  Created by Alumno on 11/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tvpeliculas: UITableView!
    var peliculas : [Pelicula] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://popmovie.azurewebsites.net/wp-json/wp/v2/peliculas").responseJSON{
            response in
            switch(response.result)
            {
            case .success(let datos) : if let arregloPeliculas = datos as? NSArray {
            
                for pelicula in arregloPeliculas{
                    if let diccionarioPelicula = pelicula as? NSDictionary
                    {
                        let nuevoElemento = Pelicula(diccionario : diccionarioPelicula)
                        self.peliculas.append(nuevoElemento)
                    }
                }
                self.tvpeliculas.reloadData()
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
        AF.request(peliculas[indexPath.row].banner!).responseImage{
            response in
            switch(response.result){
            case .success(let data) :
                celda?.imgBanner.image = data
            case .failure(_) :
                print("Algo salió mal")
            }
        }
        
        return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDatosPeliculas"{
            let destino = segue.destination as? DatosPeliculaController
            destino?.pelicula = peliculas[tvpeliculas.indexPathForSelectedRow!.row]
        }
    }

}

