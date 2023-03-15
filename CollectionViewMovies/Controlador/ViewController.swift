//
//  ViewController.swift
//  CollectionViewMovies
//
//  Created by Ziutzel grajales on 06/12/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionMovies: UICollectionView!
    
    //Creemos una variable global para que se guarde la selección del usuario
    var verMovie : Movie?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionMovies)
        NSLayoutConstraint.activate([
            collectionMovies.topAnchor.constraint(equalTo:view.topAnchor), collectionMovies.leadingAnchor.constraint(equalTo:view.leadingAnchor), collectionMovies.trailingAnchor.constraint(equalTo:view.trailingAnchor), collectionMovies.bottomAnchor.constraint(equalTo:view.bottomAnchor),
        ])
        
        collectionMovies.dataSource = self
        collectionMovies.delegate = self
        
        // Agregar un diseño o estilo al collection
        
        collectionMovies.collectionViewLayout = UICollectionViewFlowLayout()
        
        //Cambiar el modo del scroll con codigo OPCIONAL
        
        if let flowLayout = collectionMovies.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            
        }
    }
    
    // MARK: Protocolos
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      return  movies.count
        
    }
    
    //Aqui necesitamos crear una variable que guarde  los valores que se seleccionaron, utilizar el dequeueReusableCell  y agregar entre comillas el identificador que le dimos a  la celda.
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda = collectionMovies.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! MovieCellCollectionViewCell
        
        //lo del as! es simplemente castear esta celda para poder acceder al label e imagen que vinculamos en ese MovieCell y pueda personalizarlos.
        
        celda.logoMovie.image = movies[indexPath.row].imagen
        celda.tituloMovie.text = movies[indexPath.row].titulo
        return celda
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
   // Esto es una buena practica para saber si mi codigo esta bien, imprimir el titulo en este caso
       // print(movies[indexPath.row].titulo)
        
    verMovie = movies[indexPath.row]
  
    //Metodo para navegar entre pantallas
    performSegue(withIdentifier: "verSegundaPantalla", sender: self)
    }
    
    //Metodo complementario para enviar informacion a traves de un segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verSegundaPantalla" {
            
            let objDestino = segue.destination as! DetalleViewController
            
            objDestino.recibirMovie = verMovie
        }
    }
}
    //Crear  protocolo sizeForItemAt , este le preguntará al delegado el tamaño de la celda, creamos una extension de nuestro viewController para tener mas ordenado el codigo (es fuera de la llave class)

extension ViewController : UICollectionViewDelegateFlowLayout { //aqui va la parte de mi view controller donde quiero agregar lo que pondre
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120 , height: 260)
    }
    
}
