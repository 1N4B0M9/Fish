//
//  Fetch.swift
//  Fish
//
//  Created by Nathan Morelli (student LM) on 1/18/23.
//

import Foundation
struct Fishy: Decodable {
    var fishingManagement: String? = ""
    var Habitat: String? = ""
    var habitatImpacts: String? = ""
    var Location: String? = ""
    var populationStatus: String? = ""
    var scientificName: String = ""
    var photo: FishImage = FishImage()
    var name: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case fishingManagement = "Fishery Management"
        case habitatImpacts = "Habitat Impacts"
        case populationStatus = "Population Status"
        case scientificName = "Scientific Name"
        case photo = "Species Illustration Photo"
        case name = "Species Name"
    }
}

struct FishImage: Decodable {
    var src: String = "https://origin-east-01-drupal-fishwatch.woc.noaa.gov/sites/default/files/snapperred_1.jpg"
    var alt: String? = ""
    var title: String? = ""
}
extension Fishy : Identifiable {
    var id : String{name}

}
class FetchData : ObservableObject {
    @Published var response : [Fishy] = []
    func getData() async{
        let URLString = "https://www.fishwatch.gov/api/species"
        guard let url = URL(string : URLString) else {return}
        print("GO")
        do {
            let (data, _) = try await URLSession.shared.data(from : url)
            let dataString = String(data: data, encoding: .utf8)
            let response = try JSONDecoder().decode([Fishy].self, from : data)
            print(dataString ??  "HELP")
            print("GOOOOOO")
            self.response = response
        } catch {
            print(error)
        }
            
        
    }
    
    
}
