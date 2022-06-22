import SwiftUI
import RealityKit

struct ARViewContainer: View {
    var body: some View {
        ARViewRepresentable()
            .navigationTitle("")
    }
}

struct ARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let anchor = AnchorEntity()
        
        let box = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.5))
        anchor.addChild(box)
        
        arView.scene.anchors.append(anchor)
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
