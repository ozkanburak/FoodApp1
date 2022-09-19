//
//  YemeklerDetayResponse.swift
//  FoodApp
//
//  Created by Burak Özkan on 16.09.2022.
//

import Foundation

class FoodDetailResponse : Codable
{
    var sepet_yemekler : [FoodsDetail]?
    var success : Int?
}
