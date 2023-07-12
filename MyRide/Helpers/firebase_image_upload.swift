//
//  firebase_image_upload.swift
//  MyRide
//
//  Created by Keval Shah on 13/03/23.
//

import Foundation
import FirebaseStorage

class firebaseupload{
    
    static let shared = firebaseupload()
    func uploadFile(fileUrl: URL, fileName1 : String, completion : @escaping (Bool,String) -> Void) {
      do {
        // Create file name
        let fileExtension = fileUrl.pathExtension
        let fileName2 = "\(fileName1).\(fileExtension)"
        let fileName = fileName2 + "png"
        let metadata = StorageMetadata()
        let storageReference = Storage.storage().reference().child(fileName)
          let currentUploadTask = storageReference.putFile(from: fileUrl, metadata: metadata) { (storageMetaData, error) in
          if let error = error {
            print("Upload error: \(error.localizedDescription)")
              completion(false,"Fail")
            return
          }
                                                                                    
          // Show UIAlertController here
          print("Image file: \(fileName) is uploaded! View it at Firebase console!")
        
          storageReference.downloadURL { (url, error) in
            if let error = error  {
              print("Error on getting download url: \(error.localizedDescription)")
                completion(false,"Fail")
              return
            }
              completion(true,"\(url!.absoluteString)")
            print("Download url of \(fileName) is \(url!.absoluteString)")
          }
        }
      } catch {
        print("Error on extracting data from url: \(error.localizedDescription)")
      }
    }
    
    func uploadVideoFile(fileUrl: URL, fileName1 : String) {
      do {
        // Create file name
        let fileExtension = fileUrl.pathExtension
        let fileName2 = "\(fileName1).\(fileExtension)"
        let fileName = fileName2 + "mp4"
        let metadata = StorageMetadata()
        
        let storageReference = Storage.storage().reference().child(fileName)
          let currentUploadTask = storageReference.putFile(from: fileUrl, metadata: metadata) { (storageMetaData, error) in
          if let error = error {
            print("Upload error: \(error.localizedDescription)")
            return
          }
                                                                                    
          // Show UIAlertController here
          print("Image file: \(fileName) is uploaded! View it at Firebase console!")
                                                                                    
          storageReference.downloadURL { (url, error) in
            if let error = error  {
              print("Error on getting download url: \(error.localizedDescription)")
              return
            }
            print("Download url of \(fileName) is \(url!.absoluteString)")
          }
        }
      } catch {
        print("Error on extracting data from url: \(error.localizedDescription)")
      }
    }
}
