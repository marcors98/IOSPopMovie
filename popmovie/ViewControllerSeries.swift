//
//  ViewControllerSeries.swift
//  popmovie
//
//  Created by Cesar Gomez on 11/26/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewControllerSeries: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var series : [Serie] = []
    @IBOutlet weak var tvSeries: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://popmovie.azurewebsites.net/wp-json/wp/v2/series").responseJSON{
            response in
            switch(response.result)
            {
            case .success(let datos) : if let arregloPeliculas = datos as? NSArray {
            
                for pelicula in arregloPeliculas{
                    if let diccionarioPelicula = pelicula as? NSDictionary
                    {
                        let nuevoElemento = Serie(diccionario : diccionarioPelicula)
                        self.series.append(nuevoElemento)
                    }
                }
                self.tvSeries.reloadData()
            }
            case .failure(_) : print("Algo salio mal")
                
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        series.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaSerie") as? celdaSerieController
        
        celda?.lblSerie.text = series[indexPath.row].nombre
        celda?.lblGenero.text = series[indexPath.row].genero
        AF.request(series[indexPath.row].banner!).responseImage{
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
        if segue.identifier == "goToDatosSerie"{
            let destino = segue.destination as? DatosSerieController
            destino?.serie = series[tvSeries.indexPathForSelectedRow!.row]
        }
    }

    
}
