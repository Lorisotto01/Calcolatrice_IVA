//
//  ViewController.swift
//  Calcolatrice 1.0
//
//  Created by Lorenzo Sottocorno on 19/01/21.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mostraCalcolo: UILabel!
    
    var numeroSchermo: Double = 0;
    var numeroPrecedente : Double = 0;
    var operation = 0;
    var performingMath: Bool = false;
    var numeroOpzPercSchermo: Double = 0;
    
    var arreyBandiere: [String] = ["🇮🇹","🇫🇷","🇩🇪", "🇬🇧","🇮🇪","🇪🇸","🇵🇹","🇧🇪","🇦🇹","🇱🇻","🇨🇭","🇧🇬","🇱🇹","🇱🇺","🇬🇷","🇳🇱","🇵🇱","🇪🇪","🇲🇹","🇨🇾","🇭🇷","🇭🇺","🇷🇴","🇸🇪","🇫🇮","🇨🇿","🇸🇮","🇸🇰","🇩🇰"]
    
    //MARK: BOTTONI NUMERI OUTLET
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var uno: UIButton!
    @IBOutlet weak var due: UIButton!
    @IBOutlet weak var tre: UIButton!
    @IBOutlet weak var quattro: UIButton!
    @IBOutlet weak var cinque: UIButton!
    @IBOutlet weak var sei: UIButton!
    @IBOutlet weak var sette: UIButton!
    @IBOutlet weak var otto: UIButton!
    @IBOutlet weak var nove: UIButton!
    
    //MARK: BOTTONI CANCELLO OUTLET
    @IBOutlet weak var cancellaTot: UIButton!
    @IBOutlet weak var cancellaUltimo: UIButton!
    
    //MARK: BOTTONI OPERAZIONI OUTLET
    @IBOutlet weak var uguale: UIButton!
    @IBOutlet weak var piu: UIButton!
    @IBOutlet weak var meno: UIButton!
    @IBOutlet weak var per: UIButton!
    @IBOutlet weak var diviso: UIButton!
    @IBOutlet weak var virgola: UIButton!
    @IBOutlet weak var classicPercento: UIButton!
        
    //MARK: PLUS
    @IBOutlet weak var switchIva: UISwitch!
    @IBOutlet weak var abilitazione: UISwitch!
    
    //MARK: TESTO
    @IBOutlet weak var addText: UILabel!
    @IBOutlet weak var remText: UILabel!
    
    //Costraint altezza
    @IBOutlet weak var tendinaPercentuali: UIView!
    @IBOutlet weak var tendinaPercAltezza: NSLayoutConstraint!
    
    // MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        overrideUserInterfaceStyle = .light
        grafica()
        
        switchIva.isEnabled = false
        addText.isEnabled = false
        remText.isEnabled = false
        
    }
    
    
    func alertMSG (titolo: String, messaggio: String) {
        let alert = UIAlertController(title: titolo, message: messaggio, preferredStyle: .alert)
        let action = UIAlertAction(title: "Chiudi", style: .destructive, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        }
    
    
    @IBAction func abilita(_ sender: UISwitch) {
        if abilitazione.isOn {
            switchIva.isEnabled = true
            addText.isEnabled = true
            remText.isEnabled = true
        } else {
            switchIva.isEnabled = false
            addText.isEnabled = false
            remText.isEnabled = false
        }
    }
    
    //MARK: SCRTTURA NUMERI
    // Questa sezione riguarda la scrittura / visualizzazione dei numeri nella Lable
    @IBAction func numeri(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag)
            numeroSchermo = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag)
            numeroSchermo = Double(label.text!)!
        }
       
    }
    
    //--------------------------------
    
    //MARK: OPERAZIONI
    // Questa sezione riguarda tutti i bottoni numerici e per le operazioni.
    
    //MANCA VIRGOLA Sender.Tag == 10

    @IBAction func operatios(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 17 && sender.tag != 16  && sender.tag != 18 {
        numeroPrecedente = Double(label.text!)!

        if sender.tag == 12 { //Divisione
            label.text = "/";
        } else if sender.tag == 13 { //Moltiplicazione
            label.text = "x";
        } else if sender.tag == 14 { //Meno
            label.text = "-";
        } else if sender.tag == 15 { //Più
            label.text = "+";
        } else if sender.tag == 19 { // Percento
            label.text = "\(numeroSchermo) %"
        } else if sender.tag == 10 { // Virgola
           
            label.text = "\(numeroSchermo)"
        }
            
        operation = sender.tag
        performingMath = true;
        
    } else if sender.tag == 16 {
            if operation == 12{ //Divide
                label.text = String(numeroPrecedente / numeroSchermo)
                mostraCalcolo.text = String("\(numeroPrecedente) / \(numeroSchermo)")
            } else if operation == 13 { //Moltiplicazione
                label.text = String(numeroPrecedente * numeroSchermo)
                mostraCalcolo.text = String("\(numeroPrecedente) x \(numeroSchermo)")
            } else if operation == 14{ //Meno
                label.text = String(numeroPrecedente - numeroSchermo)
                mostraCalcolo.text = String("\(numeroPrecedente) - \(numeroSchermo)")
            } else if operation == 15{ //Più
                label.text = String(numeroPrecedente + numeroSchermo)
                mostraCalcolo.text = String("\(numeroPrecedente) + \(numeroSchermo)")
            } else if operation == 19 { //Percento
                
//                numeroOpzPercSchermo = numeroPrecedente
//                print("Numero Opzionale Pecento Schermo : \(numeroOpzPercSchermo)")
//                numeroPrecedente = numeroSchermo
//                print("Numero Precedente : \(numeroPrecedente)")
//                numeroSchermo = Double(label.text!)!
//                print("Numero Schermo: \(numeroSchermo)")
//
//
//                numeroSchermo = numeroOpzPercSchermo + (numeroPrecedente / 100)
//                label.text = String(numeroSchermo)
//
//
//                mostraCalcolo.text = String("\(numeroPrecedente) + \(numeroSchermo) %")
            }
    } else if sender.tag == 17{
        label.text = ""
        numeroPrecedente = 0;
        numeroSchermo = 0;
        operation = 0;
        mostraCalcolo.text = ""
    } else if sender.tag == 18 {
        if label.text != "" {
            label.text?.removeLast()
        } else {
            return
        }
    }
        
// Calcolatrice copiata da:
// https://www.instructables.com/How-to-Make-a-Calculator-in-Xcode-Using-Swift/

    }
    
    //-----------------------------------
    
    
    //MARK: TENDINA DEGLI STATI
    // Mostra tutte le bandiere che sono disponibili sull'app
    @IBOutlet weak var tendinaStati: UITableView!
    
    @IBAction func stati(_ sender: UIButton) {
        if tendinaStati.isHidden == true {
            tendinaStati.isHidden = false
        } else {
            tendinaStati.isHidden = true
        }
    }
    
    // MARK: TENDINE
    // Controllo se è stato selezionato uno Stato diverso da quello base
    // se si continua l'eseguzione normalmente
    // se no riproduce PopUp di errore
    @IBOutlet weak var bandieraEuropa: UILabel!
    
    @IBAction func percentuali(_ sender: UIButton) {
        
        if bandieraEuropa.text == "🇪🇺" {
            alertMSG(titolo: "Error 404", messaggio: "State not found")
            
        } else if arreyBandiere.contains(bandieraEuropa.text!) == true {
            
            if tendinaPercentuali.isHidden == true {
                tendinaPercentuali.isHidden = false
            } else {
                tendinaPercentuali.isHidden = true
            }
           
        }
    }
    
    // Linee Inutili, servono per togliere solo la percentuale se il bottone non esiste.
    @IBOutlet weak var onlyPercento1: UILabel!
    @IBOutlet weak var onlyPercento2: UILabel!
    @IBOutlet weak var onlyPercento3: UILabel!
    @IBOutlet weak var onlyPercento4: UILabel!
    // ---------------------------------
    @IBOutlet weak var percentuale1: UILabel!
    @IBOutlet weak var percentuale2: UILabel!
    @IBOutlet weak var percentuale3: UILabel!
    @IBOutlet weak var percentuale4: UILabel!
    
    //MARK: SWITCH DELL'IVA
    // In questa sezione si scegliera se aggiungere o rimuovere l'iva dall'importo finale
    // MARK: BOTTONI PERCENTUALE CALCOLO
    
    @IBOutlet weak var bottonePerc1: UIButton!
    @IBAction func bottonePerc1Action(_ sender: UIButton) {
        let dobLabTex = (Double(label.text!))!
        let percOne = Double(percentuale1.text!)!
        let perc = Double((dobLabTex * percOne) / 100)
        let percRem = Double((dobLabTex * 100) / (100 + percOne))
        let percAdd = Double((dobLabTex / 100) * (100 + percOne))
        if abilitazione.isOn {
            if switchIva.isOn {
                label.text! = String(percAdd)
            } else {
                label.text! = String(percRem)
            }
        } else {
            label.text = String(perc)
        }
        
    }
    
    @IBOutlet weak var bottonePerc2: UIButton!
    @IBAction func bottonePerc2Action(_ sender: UIButton) {
        let dobLabTex2 = (Double(label.text!))!
        let percTwo = Double(percentuale2.text!)!
        let perc2 = Double((dobLabTex2 * percTwo) / 100)
        let percRem2 = Double((dobLabTex2 * 100) / (100 + percTwo))
        let percAdd2 = Double((dobLabTex2 / 100) * (100 + percTwo))
        if abilitazione.isOn {
            if switchIva.isOn {
                label.text! = String(percAdd2)
            } else {
                label.text! = String(percRem2)
            }
        } else {
            label.text! = String(perc2)
        }
        
    }
    
    @IBOutlet weak var bottonePerc3: UIButton!
    @IBAction func bottonePerc3Action(_ sender: UIButton) {
        let dobLabTex3 = (Double(label.text!))!
        let percThree = Double(percentuale3.text!)!
        let perc3 = Double((dobLabTex3 * percThree) / 100)
        let percRem3 = Double((dobLabTex3 * 100) / (100 + percThree))
        let percAdd3 = Double((dobLabTex3 / 100) * (100 + percThree))
        if abilitazione.isOn {
            if switchIva.isOn {
                label.text! = String(percAdd3)
            } else {
                label.text! = String(percRem3)
            }
        } else {
            label.text! = String(perc3)
        }
        
    }
    
    
    @IBOutlet weak var bottonePerc4: UIButton!
    @IBAction func bottonePerc4Action(_ sender: UIButton) {
        let dobLabTex4 = (Double(label.text!))!
        let percFour = Double(percentuale4.text!)!
        let perc4 = Double((dobLabTex4 * percFour) / 100)
        let percRem4 = Double((dobLabTex4 * 100) / (100 + percFour))
        let percAdd4 = Double((dobLabTex4 / 100) * (100 + percFour))
        if abilitazione.isOn {
            if switchIva.isOn {
                label.text! = String(percAdd4)
            } else {
                label.text! = String(percRem4)
            }
        } else {
            label.text! = String(perc4)
        }
    }
    //------------------------
    func resetBottoniPerc(){
        bottonePerc1.isHidden = false
        onlyPercento1.isHidden = false
        bottonePerc2.isHidden = false
        onlyPercento2.isHidden = false
        bottonePerc3.isHidden = false
        onlyPercento3.isHidden = false
        bottonePerc4.isHidden = false
        onlyPercento4.isHidden = false
    }
    
//    func controlloBottoni() {
//        if percentuale1.text == "" {
//            bottonePerc1.isHidden = true
//            onlyPercento1.isHidden = true
//            // Camabio altezza
//        }
//        if percentuale2.text == "" {
//            bottonePerc2.isHidden = true
//            onlyPercento2.isHidden = true
//            tendinaPercAltezza.constant = 90
//            tendinaPercentuali.frame = tendinaPercentuali.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//            tendinaPercentuali.layoutIfNeeded()
//        }
//        if percentuale3.text == "" {
//            bottonePerc3.isHidden = true
//            onlyPercento3.isHidden = true
//            tendinaPercAltezza.constant = 180
//            tendinaPercentuali.frame = tendinaPercentuali.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//            tendinaPercentuali.layoutIfNeeded()
//        }
//        if percentuale4.text == "" {
//            bottonePerc4.isHidden = true
//            onlyPercento4.isHidden = true
//            tendinaPercAltezza.constant = 270
//            tendinaPercentuali.frame = tendinaPercentuali.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//            tendinaPercentuali.layoutIfNeeded()
//        }
//    }
    
    func controlloBottoni() {
    //        if percentuale1.text == "" {
    //            bottonePerc1.isHidden = true
    //            onlyPercento1.isHidden = true
    //            // Camabio altezza
    //        }
            if percentuale2.text == "" && percentuale3.text == "" && percentuale4.text == "" {
                onlyPercento2.isHidden = true
                bottonePerc2.isHidden = true
                bottonePerc3.isHidden = true
                onlyPercento3.isHidden = true
                onlyPercento4.isHidden = true
                bottonePerc4.isHidden = true
                tendinaPercAltezza.constant = 90
                tendinaPercentuali.frame = tendinaPercentuali.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
                tendinaPercentuali.layoutIfNeeded()
            }else if percentuale3.text == "" && percentuale4.text == "" {
                bottonePerc3.isHidden = true
                onlyPercento3.isHidden = true
                bottonePerc4.isHidden = true
                onlyPercento4.isHidden = true
                bottonePerc2.isHidden = false
                tendinaPercAltezza.constant = 180
                tendinaPercentuali.frame = tendinaPercentuali.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
                tendinaPercentuali.layoutIfNeeded()
            }else if percentuale4.text == "" {
                bottonePerc4.isHidden = true
                onlyPercento4.isHidden = true
                bottonePerc3.isHidden = false
                bottonePerc2.isHidden = false
                tendinaPercAltezza.constant = 270
                tendinaPercentuali.frame = tendinaPercentuali.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
                tendinaPercentuali.layoutIfNeeded()
            }
        }
    
    
    
    // Permette di cambiare la bandiera dello Stato in cui ci si trova.
    @IBAction func bandiere(_ sender: UIButton) {
        resetBottoniPerc()
        if sender.tag == 1 { // Italia
            bandieraEuropa.text = arreyBandiere[0]
            percentuale1.text = "22"
            percentuale2.text = "10"
            percentuale3.text = "5"
            percentuale4.text = "4.8"
                controlloBottoni()
        }
        
        else if sender.tag == 2 { // Francia
            bandieraEuropa.text = arreyBandiere[1]
            percentuale1.text = "20"
            percentuale2.text = "10"
            percentuale3.text = "5.5"
            percentuale4.text = "2.1"
                controlloBottoni()
        }
        
        else if sender.tag == 3 { // Germania
            bandieraEuropa.text = arreyBandiere[2]
            percentuale1.text = "19"
            percentuale2.text = "7"
            percentuale3.text = "" // Vuota - 0%
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 4 { // Inghilterra
            bandieraEuropa.text = arreyBandiere[3]
            percentuale1.text = "20"
            percentuale2.text = "5"
            percentuale3.text = "" // Vuota - 0%
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 5 { // Irlanda
            bandieraEuropa.text = arreyBandiere[4]
            percentuale1.text = "23"
            percentuale2.text = "13.5"
            percentuale3.text = "9"
            percentuale4.text = "4.8"
                controlloBottoni()
        }
        
        else if sender.tag == 6 { // Spagna
            bandieraEuropa.text = arreyBandiere[5]
            percentuale1.text = "21"
            percentuale2.text = "10"
            percentuale3.text = "4"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 7 { // Portogallo
            bandieraEuropa.text = arreyBandiere[6]
            percentuale1.text = "23"
            percentuale2.text = "13"
            percentuale3.text = "6"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 8 { // Belgio
            bandieraEuropa.text = arreyBandiere[7]
            percentuale1.text = "21"
            percentuale2.text = "12"
            percentuale3.text = "6"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 9 { //Austria
            bandieraEuropa.text = arreyBandiere[8]
            percentuale1.text = "20"
            percentuale2.text = "13"
            percentuale3.text = "10"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 10 { // Lettonia
            bandieraEuropa.text = arreyBandiere[9]
            percentuale1.text = "21"
            percentuale2.text = "12"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 11 { // Svizzera
            bandieraEuropa.text = arreyBandiere[10]
            percentuale1.text = "7.7"
            percentuale2.text = "3.7"
            percentuale3.text = "2.5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 12 { // Bulgaria
            bandieraEuropa.text = arreyBandiere[11]
            percentuale1.text = "20"
            percentuale2.text = "9"
            percentuale3.text = "" // Vuota - 0%
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 13 { // Lituania
            bandieraEuropa.text = arreyBandiere[12]
            percentuale1.text = "21"
            percentuale2.text = "9"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 14 { // Lussemburgo
            bandieraEuropa.text = arreyBandiere[13]
            percentuale1.text = "17"
            percentuale2.text = "8"
            percentuale3.text = "3"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 15 { // Grecia
            bandieraEuropa.text = arreyBandiere[14]
            percentuale1.text = "24"
            percentuale2.text = "13"
            percentuale3.text = "6"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 16 { // Paesi Bassi
            bandieraEuropa.text = arreyBandiere[15]
            percentuale1.text = "21"
            percentuale2.text = "9"
            percentuale3.text = "" // Vuota - 0%
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 17 { // Polonia
            bandieraEuropa.text = arreyBandiere[16]
            percentuale1.text = "23"
            percentuale2.text = "8"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 18 { // Estonia
            bandieraEuropa.text = arreyBandiere[17]
            percentuale1.text = "20"
            percentuale2.text = "9"
            percentuale3.text = "" // Vuota - 0%
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 19 { // Malta
            bandieraEuropa.text = arreyBandiere[18]
            percentuale1.text = "18"
            percentuale2.text = "7"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 20 {  // Cipro
            bandieraEuropa.text = arreyBandiere[19]
            percentuale1.text = "19"
            percentuale2.text = "9"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 21 { // Croazia
            bandieraEuropa.text = arreyBandiere[20]
            percentuale1.text = "25"
            percentuale2.text = "13"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 22 { // Ungheria
            bandieraEuropa.text = arreyBandiere[21]
            percentuale1.text = "27"
            percentuale2.text = "18"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 23 { // Romania
            bandieraEuropa.text = arreyBandiere[22]
            percentuale1.text = "19"
            percentuale2.text = "9"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 24 { // Svezia
            bandieraEuropa.text = arreyBandiere[23]
            percentuale1.text = "25"
            percentuale2.text = "12"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 25 { // Finlandia
            bandieraEuropa.text = arreyBandiere[24]
            percentuale1.text = "24"
            percentuale2.text = "14"
            percentuale3.text = "10"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 26 { // Rep. Cechia
            bandieraEuropa.text = arreyBandiere[25]
            percentuale1.text = "21"
            percentuale2.text = "15"
            percentuale3.text = "10"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 27 { // Slovenia
            bandieraEuropa.text = arreyBandiere[26]
            percentuale1.text = "22"
            percentuale2.text = "9.5"
            percentuale3.text = "5"
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 28 { // Slovacchia
            bandieraEuropa.text = arreyBandiere[27]
            percentuale1.text = "20"
            percentuale2.text = "10"
            percentuale3.text = "" // Vuota - 0%
            percentuale4.text = "" // Vuota - 0%
                controlloBottoni()
        }
        
        else if sender.tag == 29 { // Danimarca
            bandieraEuropa.text = arreyBandiere[28]
            percentuale1.text = "25"
            percentuale2.text = "" // Vuota - 0%
            percentuale3.text = "" // Vuota - 0%
            percentuale4.text = "" // Vuota - 0%
            controlloBottoni()
        }
    }
    
    func grafica(){
        
        // NUMERI
        zero.layer.borderWidth = 0.5
        zero.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        zero.clipsToBounds = true
        zero.layer.cornerRadius = 7
        zero.layer.shadowOpacity = 0.2
        zero.layer.shadowRadius = 3
        zero.layer.shadowColor = UIColor.black.cgColor
        
        uno.layer.borderWidth = 0.5
        uno.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        uno.clipsToBounds = true
        uno.layer.cornerRadius = 7
        uno.layer.shadowOpacity = 0.2
        uno.layer.shadowRadius = 3
        uno.layer.shadowColor = UIColor.black.cgColor
        
        due.layer.borderWidth = 0.5
        due.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        due.clipsToBounds = true
        due.layer.cornerRadius = 7
        due.layer.shadowOpacity = 0.2
        due.layer.shadowRadius = 3
        due.layer.shadowColor = UIColor.black.cgColor
        
        tre.layer.borderWidth = 0.5
        tre.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tre.clipsToBounds = true
        tre.layer.cornerRadius = 7
        tre.layer.shadowOpacity = 0.2
        tre.layer.shadowRadius = 3
        tre.layer.shadowColor = UIColor.black.cgColor
        
        quattro.layer.borderWidth = 0.5
        quattro.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        quattro.clipsToBounds = true
        quattro.layer.cornerRadius = 7
        quattro.layer.shadowOpacity = 0.2
        quattro.layer.shadowRadius = 3
        quattro.layer.shadowColor = UIColor.black.cgColor
        
        cinque.layer.borderWidth = 0.5
        cinque.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cinque.clipsToBounds = true
        cinque.layer.cornerRadius = 7
        cinque.layer.shadowOpacity = 0.2
        cinque.layer.shadowRadius = 3
        cinque.layer.shadowColor = UIColor.black.cgColor
        
        sei.layer.borderWidth = 0.5
        sei.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        sei.clipsToBounds = true
        sei.layer.cornerRadius = 7
        sei.layer.shadowOpacity = 0.2
        sei.layer.shadowRadius = 3
        sei.layer.shadowColor = UIColor.black.cgColor
        
        sette.layer.borderWidth = 0.5
        sette.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        sette.clipsToBounds = true
        sette.layer.cornerRadius = 7
        sette.layer.shadowOpacity = 0.2
        sette.layer.shadowRadius = 3
        sette.layer.shadowColor = UIColor.black.cgColor
        
        otto.layer.borderWidth = 0.5
        otto.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        otto.clipsToBounds = true
        otto.layer.cornerRadius = 7
        otto.layer.shadowOpacity = 0.2
        otto.layer.shadowRadius = 3
        otto.layer.shadowColor = UIColor.black.cgColor
        
        nove.layer.borderWidth = 0.5
        nove.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        nove.clipsToBounds = true
        nove.layer.cornerRadius = 7
        nove.layer.shadowOpacity = 0.2
        nove.layer.shadowRadius = 3
        nove.layer.shadowColor = UIColor.black.cgColor
        
        // OPERAZIONI
        cancellaTot.layer.borderWidth = 0.5
        cancellaTot.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cancellaTot.clipsToBounds = true
        cancellaTot.layer.cornerRadius = 7
        cancellaTot.layer.shadowOpacity = 0.2
        cancellaTot.layer.shadowRadius = 3
        cancellaTot.layer.shadowColor = UIColor.black.cgColor
        
        cancellaUltimo.layer.borderWidth = 0.5
        cancellaUltimo.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cancellaUltimo.clipsToBounds = true
        cancellaUltimo.layer.cornerRadius = 7
        cancellaUltimo.layer.shadowOpacity = 0.2
        cancellaUltimo.layer.shadowRadius = 3
        cancellaUltimo.layer.shadowColor = UIColor.black.cgColor
        
        classicPercento.layer.borderWidth = 0.5
        classicPercento.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        classicPercento.clipsToBounds = true
        classicPercento.layer.cornerRadius = 7
        classicPercento.layer.shadowOpacity = 0.2
        classicPercento.layer.shadowRadius = 3
        classicPercento.layer.shadowColor = UIColor.black.cgColor
        
        uguale.layer.borderWidth = 0.5
        uguale.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        uguale.clipsToBounds = true
        uguale.layer.cornerRadius = 9
        uguale.layer.shadowOpacity = 0.2
        uguale.layer.shadowRadius = 3
        uguale.layer.shadowColor = UIColor.black.cgColor
        uguale.layer.backgroundColor = #colorLiteral(red: 0.007435939275, green: 0.1986082196, blue: 0.6095432639, alpha: 1)
        
        virgola.layer.borderWidth = 0.5
        virgola.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        virgola.clipsToBounds = true
        virgola.layer.cornerRadius = 7
        virgola.layer.shadowOpacity = 0.2
        virgola.layer.shadowRadius = 3
        virgola.layer.shadowColor = UIColor.black.cgColor
        
        piu.layer.borderWidth = 0.5
        piu.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        piu.clipsToBounds = true
        piu.layer.cornerRadius = 33
        piu.layer.shadowOpacity = 0.2
        piu.layer.shadowRadius = 3
        piu.layer.shadowColor = UIColor.black.cgColor
        piu.layer.backgroundColor = #colorLiteral(red: 0.08010312908, green: 0.3581580292, blue: 0.7727039222, alpha: 1)
        
        meno.layer.borderWidth = 0.5
        meno.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        meno.clipsToBounds = true
        meno.layer.cornerRadius = 33
        meno.layer.shadowOpacity = 0.2
        meno.layer.shadowRadius = 3
        meno.layer.shadowColor = UIColor.black.cgColor
        meno.layer.backgroundColor = #colorLiteral(red: 0.08010312908, green: 0.3581580292, blue: 0.7727039222, alpha: 1)
        
        per.layer.borderWidth = 0.5
        per.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        per.clipsToBounds = true
        per.layer.cornerRadius = 33
        per.layer.shadowOpacity = 0.2
        per.layer.shadowRadius = 3
        per.layer.shadowColor = UIColor.black.cgColor
        per.layer.backgroundColor = #colorLiteral(red: 0.08010312908, green: 0.3581580292, blue: 0.7727039222, alpha: 1)
        
        diviso.layer.borderWidth = 0.5
        diviso.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        diviso.clipsToBounds = true
        diviso.layer.cornerRadius = 33
        diviso.layer.shadowOpacity = 0.2
        diviso.layer.shadowRadius = 3
        diviso.layer.shadowColor = UIColor.black.cgColor
        diviso.layer.backgroundColor = #colorLiteral(red: 0.08010312908, green: 0.3581580292, blue: 0.7727039222, alpha: 1)
    }

   

}



    



