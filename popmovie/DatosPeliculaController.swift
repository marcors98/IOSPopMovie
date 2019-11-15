//
//  DatosPeliculaController.swift
//  popmovie
//
//  Created by Francisco Humberto León Ozuna on 14/11/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DatosPeliculaController : UIViewController {
    
    var pelicula : Pelicula?
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblAño: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblTrailer: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var lblElenco: UILabel!
    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var imgPoster: UIImageView!
    
    override func viewDidLoad() {
        lblNombre.text = pelicula?.nombre
        lblGenero.text = pelicula?.genero
        lblAño.text = pelicula?.año
        lblDirector.text = pelicula?.director
        lblTrailer.text = pelicula?.trailer
        lblDuracion.text = pelicula?.duracion
        lblElenco.text = pelicula?.elenco
        lblPais.text = pelicula?.origen
        
        AF.request(pelicula!.banner!).responseImage{
            response in
            switch(response.result){
            case .success(let data) :
                self.imgBanner.image = data
            case .failure(_) :
                print("Algo salió mal")
            }
        }
        AF.request(pelicula!.poster!).responseImage{
            response in
            switch(response.result){
            case .success(let data) :
                self.imgPoster.image = data
            case .failure(_) :
                print("Algo salió mal")
            }
        }
        
    }
}

