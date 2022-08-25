
//import Foundation
//#if os(macOS) || os(iOS)
//import simd
//#endif
//
//#if os(macOS) || os(iOS)
//public struct SimdRecordingMul: Codable {
//    public let p1: SIMD4<Double>
//    public let p2: SIMD4<Double>
//    public let res: SIMD4<Double>
//}
//public struct SimdRecordingAct: Codable {
//    public let p1: SIMD4<Double>
//    public let p2: simd_double3
//    public let res: simd_double3
//}
//public struct SimdRecordingCross: Codable {
//    public let p1: simd_double3
//    public let p2: simd_double3
//    public let res: simd_double3
//}
//public struct SimdRecording: Codable {
//    public var enable: Bool
//    public var mul: [SimdRecordingMul]
//    public var act: [SimdRecordingAct]
//    public var cross: [SimdRecordingCross]
//}
//#else
//public struct SimdRecordingMul: Codable {
//    public let p1: simd_quatd
//    public let p2: simd_quatd
//    public let res: simd_quatd
//}
//public struct SimdRecordingAct: Codable {
//    public let p1: simd_quatd
//    public let p2: simd_double3
//    public let res: simd_double3
//}
//public struct SimdRecordingCross: Codable {
//    public let p1: simd_double3
//    public let p2: simd_double3
//    public let res: simd_double3
//}
//public struct SimdRecording: Codable {
//    public var enable: Bool
//    public var mul: [SimdRecordingMul]
//    public var act: [SimdRecordingAct]
//    public var cross: [SimdRecordingCross]
//
//    mutating func append(mul: SimdRecordingMul) {
//        self.mul.append(mul)
//    }
//    mutating func append(act: SimdRecordingAct) {
//        self.act.append(act)
//    }
//    mutating func append(cross: SimdRecordingCross) {
//        self.cross.append(cross)
//    }
//}
//#endif
//public var recording = SimdRecording(enable: false, mul: [], act: [], cross: [])
