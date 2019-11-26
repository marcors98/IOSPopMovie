//
//  DatosSerieController.swift
//  popmovie
//
//  Created by Cesar Gomez on 11/26/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DatosSerieController : UIViewController{
    

    var serie : Serie?
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblAño: UILabel!
    @IBOutlet weak var lblProductor: UILabel!
    @IBOutlet weak var lblTemporadas: UILabel!
    @IBOutlet weak var lblElenco: UILabel!
    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var imgPoster: UIImageView!
    
    override func viewDidLoad() {
        lblNombre.text = serie?.nombre
        lblGenero.text = serie?.genero
        lblAño.text = serie?.año
        lblProductor.text = serie?.productor
        lblTemporadas.text = serie?.temporadas
        lblElenco.text = serie?.elenco
        lblPais.text = serie?.origen
        
        AF.request(serie!.banner!).responseImage{
            response in
            switch(response.result){
            case .success(let data) :
                self.imgBanner.image = data
            case .failure(_) :
                print("Algo salió mal")
            }
        }
        AF.request(serie!.poster!).responseImage{
            response in
            switch(response.result){
            case .success(let data) :
                self.imgPoster.image = data
            case .failure(_) :
                print("Algo salió mal")
            }
        }
        
    }
    
    @IBAction func doTapVideo(_ sender: Any){
        let webURL = NSURL(string: serie!.trailer!)!
        let application = UIApplication.shared
        
        application.open(webURL as URL)
    }
    
    @IBAction func doTapRegresar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
