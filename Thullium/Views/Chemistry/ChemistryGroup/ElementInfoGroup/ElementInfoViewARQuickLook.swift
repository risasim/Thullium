//
//  ElementInfoViewARQuickLook.swift
//  Thullium
//
//  Created by Richard on 10.02.2024.
//

import UIKit
import QuickLook
import ARKit
import SwiftUI

import UIKit
import QuickLook

class ElementInfoViewARQuickLook: UIViewController, QLPreviewControllerDataSource {
    let usdzFileURL: URL
    let allowsContentScaling = true
    
    init(usdzFileURL: URL) {
        self.usdzFileURL = usdzFileURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true)
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let previewItem = ARQuickLookPreviewItem(fileAt: usdzFileURL)
        previewItem.allowsContentScaling = allowsContentScaling
        return previewItem
    }
}

struct ARQLElementInfoView: UIViewControllerRepresentable {
    let usdzFileURL: URL
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    typealias UIViewControllerType = ElementInfoViewARQuickLook
    
    func makeUIViewController(context: Context) -> ElementInfoViewARQuickLook {
        return ElementInfoViewARQuickLook(usdzFileURL: usdzFileURL)
    }
    
    func updateUIViewController(_ uiViewController: ElementInfoViewARQuickLook, context: Context) {
    }
    
    class Coordinator: NSObject {
        var parent: ARQLElementInfoView
        init(parent: ARQLElementInfoView) {
            self.parent = parent
        }
    }
}
