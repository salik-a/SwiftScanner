//
//  ScannerView.swift
//  Scanner
//
//  Created by Alper Salık on 2.02.2022.
//

import VisionKit
import SwiftUI

struct ScannerView: UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
    
   
    
    private let completionHandler: ([String]?) -> Void
    
    init(completion: @escaping ([String]?) -> Void){
        self.completionHandler = completion
    }
    
    typealias UIViewControllerRepresentableType = VNDocumentCameraViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScannerView>) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
   
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(completion: completionHandler)
    }
    
    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate{
        private let completionHandler: ([String]?) -> Void
        
        init(completion: @escaping ([String]?) -> Void){
            self.completionHandler = completion
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            completionHandler(nil)
        }
        func documentCameraViewControllerDidCancel(_ controller:VNDocumentCameraViewController){
            completionHandler(nil)
        }
    }
    
    
}


