//
//  CardModel.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 23.01.2025.
//

import Foundation

struct CardModel: Identifiable {

  var id: Int = 0
  var name: String = ""
  var age: String = ""
  var gender: Gender = .male
  var description: String = ""
  var imgs: [String] = []
  var imgCount: Int {
    return imgs.count
  }
  var currentImgIndex: Int = 0

  init(id: Int, name: String, age: String, gender: Gender, description: String, imgs: [String]) {
    self.id = id
    self.name = name
    self.age = age
    self.gender = gender
    self.description = description
    self.imgs = imgs
  }

  mutating func nextImg() {
    if currentImgIndex != imgCount - 1 {
      currentImgIndex += 1
    }
  }

  mutating func previousImg() {
    if currentImgIndex != 0 {
      currentImgIndex -= 1
    }
  }
}

enum Gender: String {
  case male
  case female
}
