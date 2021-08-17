//
//  ViewController.swift
//  NatsDemo
//
//  Created by bany on 13/08/2021.
//

import UIKit
import SwiftNats

class ViewController: UIViewController {
    
    @IBOutlet weak var labelStatus: UILabel!
    var pubsub: Nats!
    let subject = "gossipeban"
    override func viewDidLoad() {
        super.viewDidLoad()

        pubsub = Nats(url: "nats://host:port",
                      mode: .tokenAuthorization(token: "token"))
//        pubsub = Nats(url: "nats://host:port",
//                      mode: .userAuthorization(user: "user", password: "password"))
//        pubsub = Nats(url: "nats://host:port",
//                      mode: .unAuthorization // default)
        pubsub.delegate = self
        
        pubsub.subscribe(subject)
        
    }
    
    @IBAction func publish(_ sender: Any) {
        pubsub.publish(subject, payload: "foo.bar")
    }
    
    @IBAction func connect(_ sender: Any) {
        pubsub.connect()
    }
    
    @IBAction func disconnect(_ sender: Any) {
        pubsub.disconnect()
    }
}

extension ViewController: NatsDelegate {
    func natsDidConnect(nats: Nats) {
        print("natsDidConnect")
        labelStatus.text = "natsDidConnect"
    }
    func natsDidConnectFailure(nats: Nats) {
        print("natsDidConnectFailure")
        labelStatus.text = "natsDidConnectFailure"
    }
    func natsDidDisconnect(nats: Nats, error: NSError?) {
        print("natsDidDisconnect")
        labelStatus.text = "natsDidDisconnect"
    }
    func natsDidReceiveMessage(nats: Nats, msg: NatsMessage) {
        print("natsDidReceiveMessage")
        labelStatus.text = "natsDidReceiveMessage"
        print(msg)
    }
    func natsDidReceivePing(nats: Nats) {
        print("natsDidReceivePing")
        labelStatus.text = "natsDidReceivePing"
    }
    
    func natsDidReceiveProcessOk(nats: Nats) {
        print("natsDidReceiveProcessOk")
        labelStatus.text = "natsDidReceiveProcessOk"
    }
    func natsDidReceiveProcessError(nats: Nats, msg: String) {
        print("natsDidReceiveProcessError")
        labelStatus.text = "natsDidReceiveProcessError"
    }
}
