import Foundation

#if os(macOS) || os(iOS)
import simd
#endif

#if os(macOS)
let record = false
public struct SimdRecordingMul: Codable {
    public let p1: SIMD4<Double>
    public let p2: SIMD4<Double>
    public let res: SIMD4<Double>
}
public struct SimdRecordingAct: Codable {
    public let p1: SIMD4<Double>
    public let p2: simd_double3
    public let res: simd_double3
}
public struct SimdRecording: Codable {
    public var mul: [SimdRecordingMul]
    public var act: [SimdRecordingAct]
}
#else
let record = true
struct SimdRecordingMul: Codable {
    let p1: simd_quatd
    let p2: simd_quatd
    let res: simd_quatd
}
struct SimdRecordingAct: Codable {
    let p1: simd_quatd
    let p2: simd_double3
    let res: simd_double3
}
struct SimdRecording: Codable {
    var mul: [SimdRecordingMul]
    var act: [SimdRecordingAct]
}
#endif
var recording = SimdRecording(mul: [], act: [])

#if os(Linux)
public struct simd_double2: Codable, Hashable {
    public var x: Double
    public var y: Double

    public init(_ x: Double,_ y: Double) {
        self.x = x
        self.y = y
    }
    public init(x: Double,y: Double) {
        self.x = x
        self.y = y
    }
    public init(from decoder: Decoder) throws {
        let a = try Array<Double>.init(from: decoder)
        self.x = a[0]
        self.y = a[1]
    }
    public func encode(to encoder: Encoder) throws {
        let v:[Double] = [self.x, self.y]
        try v.encode(to: encoder)
    }
}
extension simd_double2: Equatable {
    public static func == (left: simd_double2, right: simd_double2) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}
public extension simd_double2 {
    static func + (left: simd_double2, right: simd_double2) -> simd_double2 {
        return simd_double2(left.x + right.x, left.y + right.y)
    }
    static func - (left: simd_double2, right: simd_double2) -> simd_double2 {
        return simd_double2(left.x - right.x, left.y - right.y)
    }
    static prefix func - (vector: simd_double2) -> simd_double2 {
        return simd_double2(-vector.x, -vector.y)
    }
    static func * (left: simd_double2, right: simd_double2) -> simd_double2 {
        return simd_double2(left.x * right.x, left.y * right.y)
    }
    static func * (left: simd_double2, right: Double) -> simd_double2 {
        return simd_double2(left.x * right, left.y * right)
    }
    static func * (left: Double, right: simd_double2) -> simd_double2 {
        return simd_double2(left * right.x, left * right.y)
    }
    static func / (left: simd_double2, right: Double) -> simd_double2 {
        return simd_double2(left.x / right, left.y / right)
    }
}

public struct simd_double3: Codable, Hashable {
    public var x: Double
    public var y: Double
    public var z: Double

    public init(_ x: Double,_ y: Double,_ z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    public init(x: Double,y: Double,z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    public init(_ x: Int,_ y: Int,_ z: Int) {
        self.x = Double(x)
        self.y = Double(y)
        self.z = Double(z)
    }
    public init(x: Int,y: Int,z: Int) {
        self.x = Double(x)
        self.y = Double(y)
        self.z = Double(z)
    }
    public init(_ v: [Int]) {
        self.x = Double(v[0])
        self.y = Double(v[1])
        self.z = Double(v[2])
    }
    public init(_ v: [Double]) {
        self.x = v[0]
        self.y = v[1]
        self.z = v[2]
    }
    public init(from decoder: Decoder) throws {
        let a = try Array<Double>.init(from: decoder)
        self.x = a[0]
        self.y = a[1]
        self.z = a[2]
    }
    public func encode(to encoder: Encoder) throws {
        let v:[Double] = [self.x, self.y,self.z]
        try v.encode(to: encoder)
    }
    public static let zero = simd_double3(0,0,0)
    public static let one = simd_double3(1,1,1)
}
extension simd_double3: Equatable {
    public static func == (left: simd_double3, right: simd_double3) -> Bool {
        return (left.x == right.x) && (left.y == right.y) && (left.z == right.z)
    }
}
public extension simd_double3 {
    static func + (left: simd_double3, right: simd_double3) -> simd_double3 {
        return simd_double3(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    static func + (left: simd_double3, right: Double) -> simd_double3 {
        return simd_double3(left.x + right, left.y + right, left.z + right)
    }
    static func += (left: inout simd_double3, right: simd_double3) {
        left.x += right.x
        left.y += right.y
        left.z += right.z
    }
    static func - (left: simd_double3, right: simd_double3) -> simd_double3 {
        return simd_double3(left.x - right.x, left.y - right.y, left.z - right.z)
    }
    static func - (left: simd_double3, right: Double) -> simd_double3 {
        return simd_double3(left.x - right, left.y - right, left.z - right)
    }
    static func * (left: simd_double3, right: Double) -> simd_double3 {
        return simd_double3(left.x * right, left.y * right, left.z * right)
    }
    static func * (left: Double, right: simd_double3) -> simd_double3 {
        return simd_double3(left * right.x, left * right.y, left * right.z)
    }
    static func * (left: simd_double3, right: simd_double3) -> simd_double3 {
        return simd_double3(left.x * right.x, left.y * right.y, left.z * right.z)
    }
    static func / (left: simd_double3, right: Double) -> simd_double3 {
        return simd_double3(left.x / right, left.y / right, left.z / right)
    }
    static prefix func - (vector: simd_double3) -> simd_double3 {
        return simd_double3(-vector.x, -vector.y, -vector.z)
    }
}

public struct simd_quatd: Codable {
    public var ix: Double
    public var iy: Double
    public var iz: Double
    public var r: Double

    public init(_ ix: Double,_ iy: Double,_ iz: Double,_ r: Double) {
        self.ix = ix
        self.iy = iy
        self.iz = iz
        self.r = r
    }

    public init(ix: Double,iy: Double,iz: Double,r: Double) {
        self.ix = ix
        self.iy = iy
        self.iz = iz
        self.r = r
    }

    public init(from decoder: Decoder) throws {
        let a = try Array<Double>.init(from: decoder)
        self.ix = a[0]
        self.iy = a[1]
        self.iz = a[2]
        self.r = a[2]
    }
    public func encode(to encoder: Encoder) throws {
        let v:[Double] = [self.ix, self.iy,self.iz,self.r]
        try v.encode(to: encoder)
    }
}

public struct simd_matrix: Codable, Hashable {
    public var c1: simd_double2
    public var c2: simd_double2

    public init(_ c1: simd_double2,_ c2: simd_double2) {
        self.c1 = c1
        self.c2 = c1
    }
}

public func simd_dot(_ left: simd_double2, _ right: simd_double2) -> Double {
    return left.x*right.x + left.y*right.y
}
public func simd_dot(_ left: simd_double3, _ right: simd_double3) -> Double {
    return left.x*right.x + left.y*right.y + left.z*right.z
}
public func simd_distance(_ left: simd_double2, _ right: simd_double2) -> Double {
    let dx = left.x - right.x
    let dy = left.y - right.y
    let d2 = dx*dx + dy*dy
    return d2.squareRoot()
}
public func simd_distance(_ left: simd_double3, _ right: simd_double3) -> Double {
    let dx = left.x - right.x
    let dy = left.y - right.y
    let dz = left.z - right.z
    let d2 = dx*dx + dy*dy + dz*dz
    return d2.squareRoot()
}
public func simd_cross(_ left: simd_double3, _ right: simd_double3) -> simd_double3 {
    let x = left.y*right.z - left.z*right.y
    let y = left.z*right.x - left.x*right.z
    let z = left.x*right.y - left.y*right.x
    return simd_double3(x,y,z)
}
public func simd_min(_ left: simd_double3, _ right: simd_double3) -> simd_double3 {
    return simd_double3(min(left.x,right.x), min(left.y,right.y), min(left.z,right.z))
}
public func simd_max(_ left: simd_double3, _ right: simd_double3) -> simd_double3 {
    return simd_double3(max(left.x,right.x), max(left.y,right.y), max(left.z,right.z))
}
public func simd_min(_ left: simd_double2, _ right: simd_double2) -> simd_double2 {
    return simd_double2(min(left.x,right.x), min(left.y,right.y))
}
public func simd_max(_ left: simd_double2, _ right: simd_double2) -> simd_double2 {
    return simd_double2(max(left.x,right.x), max(left.y,right.y))
}
public func simd_length(_ vector: simd_double2) -> Double {
    let d2 = vector.x*vector.x + vector.y*vector.y
    return d2.squareRoot()
}
public func simd_length(_ vector: simd_double3) -> Double {
    let d2 = vector.x*vector.x + vector.y*vector.y + vector.z*vector.z
    return d2.squareRoot()
}
public func simd_normalize(_ vector: simd_double2) -> simd_double2 {
    let d = simd_length(vector)
    return simd_double2(vector.x/d, vector.y/d)
}
public func simd_normalize(_ vector: simd_double3) -> simd_double3 {
    let d = simd_length(vector)
    return simd_double3(vector.x/d, vector.y/d, vector.z/d)
}
public func abs(_ vector: simd_double3) -> simd_double3 {
    return simd_double3(abs(vector.x), abs(vector.y), abs(vector.z))
}
public func simd_mul(_ left: simd_matrix, _ right: simd_double2) -> simd_double2 {
    let x = left.c1.x * right.x + left.c2.x * right.y
    let y = left.c1.y * right.x + left.c2.y * right.y
    return simd_double2(x,y)
}
public func simd_act(_ quat: simd_quatd, _ vector: simd_double3) -> simd_double3 {
    // https://en..m.wijipedia.org/wiki/Euler-Rodrigues_formula
    // alternative: https://gamedev.stackexchange.com/questions/28395/rotating-vector3-by-a-quaternion
    let w = simd_double3(quat.ix,quat.iy,quat.iz)
    let w_x = simd_cross(w,vector)
    let w_w_x = simd_cross(w, w_x)
    let res = vector + 2*quat.r*w_x + 2 * w_w_x
    if record {
        let entry = SimdRecordingAct(p1: quat, p2: vector, res: res)
        recording.act.append(entry)
    }
    return res
}
public func simd_quaternion(_ ang: Double, _ vector: simd_double3) -> simd_quatd {
    let n = simd_normalize(vector)
    let c = cos(ang/2)
    let s = sin(ang/2)
    let ix = n.x * s
    let iy = n.y * s
    let iz = n.z * s
    return simd_quatd(ix,iy,iz,c)
}
public func simd_mul(_ left: simd_quatd, _ right: simd_quatd) -> simd_quatd {
    // Hamilton product https://en.wikipedia.org/wiki/Quaternion
    let a1 = left.r
    let a2 = right.r
    let b1 = left.ix
    let b2 = right.ix
    let c1 = left.iy
    let c2 = right.iy
    let d1 = left.iz
    let d2 = right.iz
    let r  = a1*a2 - b1*b2 - c1*c2 - d1*d2
    let ix = a1*b2 + b1*a2 + c1*d2 - d1*c2
    let iy = a1*c2 - b1*d2 + c1*a2 + d1*b2
    let iz = a1*d2 + b1*c2 - c1*b2 + d1*a2
    let res =  simd_quatd(ix,iy,iz,r)
    if record {
        let entry = SimdRecordingMul(p1: left, p2: right, res: res)
        recording.mul.append(entry)
    }
    return res
}
public func writeRecording(to encoder: Encoder) throws {
    try recording.encode(to: encoder)
}
#endif
