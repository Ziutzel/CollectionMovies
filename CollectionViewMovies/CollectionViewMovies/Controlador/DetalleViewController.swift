//
//  DetalleViewController.swift
//  CollectionViewMovies
//
//  Created by Ziutzel grajales on 07/12/22.
//

import UIKit
import youtube_ios_player_helper

class DetalleViewController: UIViewController {
    
    var recibirMovie: Movie?
    
    @IBOutlet weak var posterMovie: UIImageView!
    
    @IBOutlet weak var tituloMovieLabel: UILabel!
    
    @IBOutlet weak var descripcionMovie: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterMovie.image = recibirMovie?.imagen
        tituloMovieLabel.text = recibirMovie?.titulo
        descripcionMovie.text = recibirMovie?.descripcion
        
        print("id Trailer : \(String(describing: recibirMovie?.urlTrailer))")
        
        //Ojo, aqui no es necesario cambiar el texto del boton, por lo cual no tenemos que enviarle nada.
        
    }
    
    @IBAction func verTrailerButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "verTrailer", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "verTrailer"  {
            
        let objDestino = segue.destination as! TrailerViewController
            
            objDestino.recibirUrlTrailer = recibirMovie!.urlTrailer
            
        }
    }
}
