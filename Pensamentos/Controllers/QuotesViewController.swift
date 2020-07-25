//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Gilmar Queiroz on 20/07/20.
//  Copyright © 2020 Gilmar Queiroz. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var lbQuato: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    let quotesManeger = QuotesMeneger()
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil ) {
             (notification) in
             self.formatView()
         }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
        
    }
    
    func formatView(){
        
       view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0 , green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        
        lbQuato.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor =  config.colorScheme == 0 ? UIColor(red: 192.0/255.0 , green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        
        prepareQuotes()
        
    }
    
    func prepareQuotes(){
        timer?.invalidate()
        
       if config.autoRefresh {
        timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval , repeats: true) { (timer) in
                self.showRamdemQuote()
            }
        }
        
        self.showRamdemQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.prepareQuotes()
    }
    
    func showRamdemQuote(){
        let quote = quotesManeger.getRandomQuote()
        lbQuato.text =  quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image =  ivPhoto.image
        lbQuato.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        ivPhoto.alpha = 0.0
        ctTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuato.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhotoBg.alpha = 1.0
            self.ivPhoto.alpha = 0.20
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
}
