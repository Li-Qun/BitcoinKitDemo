//
//  Test.swift
//  BitcoinKitDemo
//
//  Created by HF on 2018/11/8.
//  Copyright © 2018年 HF. All rights reserved.
//

import Foundation
import BitcoinKit

@objc public class Test:NSObject {
    public override init() {
        super.init()
        self.testManageBTCWallet1()
    }
    
    func testManageBTCWallet1 ()
    {//已知私钥导出对应BTC的地址
        let privateKey = try? PrivateKey(wif: "KyvezTu9JiBhhDhB7JkHWWhfXj8m7S6ZVRRNChwEqNyyh41JZU42")
        let address  = privateKey?.publicKey().toLegacy().description
        print(address!)
    }
    
    func testManageBTCWallet ()
    {//已知私钥导出对应BTC的地址
        let privateKey = try? PrivateKey(wif: "KyvezTu9JiBhhDhB7JkHWWhfXj8m7S6ZVRRNChwEqNyyh41JZU42")
        let address  = privateKey?.publicKey().toLegacy().description
        print(address!)
    }
    public func testCreateBTCWallet ()
    {
        // Generate mnemonic
        let mnemonic = try! Mnemonic.generate()
        /*助记词 mosquito churn zebra local toward castle inherit crane abstract current town write
         私钥 KyvezTu9JiBhhDhB7JkHWWhfXj8m7S6ZVRRNChwEqNyyh41JZU42
         公钥 02caf04ed7250f76d22e6b6bc56fc2255b2f5162568c77f754d961c092746dfefe
         地址 1DWcZqKZdj4ShHU1oqYRQ5YXnRNcyeaaSR
         seed c9a6a5732f4699176dafda6399bc5fa0d3cc1c54da287a77a9627059fe489e65139deb1abab71fb10193c750c778d97f72a58a627489a2578a84879146968fd9
         */
        
        var bigStr = ""
        for str in mnemonic {
            bigStr .append(str )
            bigStr .append(" " )
        }
        // Generate seed from the mnemonic
        let seed = Mnemonic.seed(mnemonic: mnemonic, passphrase: "password")
        let wallet = HDWallet(seed: seed, network: .mainnetBTC)
        let bip32RootKey = HDPrivateKey(seed: seed, network: .mainnet).extended() //BIP32 Root Key
        let privateKey = try! wallet.privateKey(index: 0).toWIF() // m/44'/0'/0'/0/0 与最后一个0对应私钥
        let publicKey = try! wallet.publicKey(index: 0).raw.hex   //对应公钥
        let address = try! wallet.publicKey(index: 0).toLegacy().description //对应地址
        print(privateKey)
    }
}
