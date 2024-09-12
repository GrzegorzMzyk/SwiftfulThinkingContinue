//
//  FileManagerBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 11/09/2024.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = gethPathForImage(name: name) else {
            print("Error getting data")
            return
        }
//      //  let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
//      //  let directory3 = FileManager.default.temporaryDirectory
//        let path = directory?.appendingPathComponent("\(name).jpeg")
    
        do {
         try   data.write(to: path)
            print("Succes saving")
        } catch let error {
            print ("error saving: \(error)")
        }
        
    }
    func getImage(name: String) -> UIImage? {
        guard
            let path = gethPathForImage(name: name)?.path,
                FileManager.default.fileExists(atPath: path) else {
            print("Error getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    func gethPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).jpeg") else {
            print("Error getting path")
            return nil
        }
        return path
    }
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "dog-shiba"
    let manager = LocalFileManager.instance
    
    init() {
      //  getImageFromAssetsFolder()
        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
       image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
        manager.saveImage(image: image, name: imageName)
    }
}



struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button {
                    vm.saveImage()
                } label: {
                     Text("Save to FM")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

             
                Spacer()
            }.navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
