//
//  CacheBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 17/09/2024.
//

import SwiftUI

class CacheManager {
    static let instance = CacheManager() // singleton
    private init() { }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("Addet to chache")
    }
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("removed from cache")
    }
    func get(name:String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
    
}

class CacheVievModel: ObservableObject {
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage : UIImage? = nil
    let imageName:String = "dog-shiba"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    func saveToCache() {
        guard let image = startingImage else { return }
        manager.add(image: image, name: imageName)
    }
    func removeFromCache() {
        manager.remove(name: imageName)
    }
    func getFromCache () {
        cachedImage = manager.get(name: imageName)
    }
}

struct CacheBootcamp: View {
        
    @StateObject var vm = CacheVievModel()
        
        var body: some View {
            NavigationStack {
                VStack {
                    if let image = vm.startingImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    HStack {
                        Button {
                            vm.saveToCache()
                        } label: {
                             Text("Save to cache")
                                .foregroundStyle(Color.white)
                                .font(.headline)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        Button {
                            vm.removeFromCache()
                        } label: {
                             Text("Delete from cache")
                                .foregroundStyle(Color.white)
                                .font(.headline)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    Button {
                        vm.getFromCache()
                    } label: {
                         Text("Get from cache")
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    if let image = vm.cachedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                 
                    Spacer()
                }.navigationTitle("Cache Bootcamp")
            }
        }
    }

#Preview {
    CacheBootcamp()
}
