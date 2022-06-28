import SwiftUI
import UIKit
import RealityKit
import SceneKit
import ARKit

struct ARViewContainer: View {
    var body: some View {
        ARViewControllerRepresentable()
            .navigationTitle("")
    }
}

// MARK: - ARViewControllerRepresentable
struct ARViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARViewController {
        let arVC = ARViewController()
        return arVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

// MARK: - ARViewController
class ARViewController: UIViewController {
    var arView: ARSCNView {
        return self.view as! ARSCNView
     }
     override func loadView() {
       self.view = ARSCNView(frame: .zero)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSceneView()
    }
    
    func setUpSceneView() {
//        sceneView = ARSCNView()
        let daltonScene = SCNScene(named: "dalton.scn")
        guard let daltonNode = daltonScene?.rootNode.childNode(withName: "daltonModel", recursively: true) else {
            fatalError()
        }
//        daltonNode.position = SCNVector3(0, 0, -10)
//
//        scene.rootNode.addChildNode(daltonNode)
        arView.delegate = self
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        arView.session.run(configuration)
        arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        let scene = SCNScene()
        arView.scene = scene
    }
}

extension ARViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let plane = SCNPlane(width: width, height: height)
                
        let planeNode = SCNNode(geometry: plane)
        
        let daltonScene = SCNScene(named: "dalton.scn")
        guard let daltonNode = daltonScene?.rootNode.childNode(withName: "daltonModel", recursively: true) else {
            fatalError()
        }
        
        let thomsonScene = SCNScene(named: "thomson.scn")
        guard let thomsonNode = thomsonScene?.rootNode.childNode(withName: "thomsonModel", recursively: true) else {
            fatalError()
        }
        
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x,y,z)
        planeNode.eulerAngles.x = -.pi / 2
        
        daltonNode.position = SCNVector3(x,y,z)
        daltonNode.scale = SCNVector3(0.06, 0.06, 0.06)
        
        thomsonNode.position = planeNode.position
        thomsonNode.scale = SCNVector3(0.06, 0.06, 0.06)
        
        node.addChildNode(thomsonNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
    }
}
