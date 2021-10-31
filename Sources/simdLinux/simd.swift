public struct simd_double2: Decodable {
    public var x: Double
    public var y: Double
}
public struct simd_double3: Decodable {
    public var x: Double
    public var y: Double
    public var z: Double
}
public func simd_dot(_ x: simd_double3, _ y: simd_double3) -> Double {
    return x.x*y.x + x.y*y.y + x.z*y.z
}
public func simd_distance(_ x: simd_double3, _ y: simd_double3) -> Double {
    let dx = x.x - y.x
    let dy = x.y - y.y
    let dz = x.z - y.z
    let d2 = dx*dx + dy*dy + dz*dz
    return d2.squareRoot()
}
public func simd_min(_ x: simd_double3, _ y: simd_double3) -> simd_double3 {
    return simd_double3(x: min(x.x,y.x), y: min(x.y,y.y), z: min(x.z,y.z))
}
public func simd_max(_ x: simd_double3, _ y: simd_double3) -> simd_double3 {
    return simd_double3(x: max(x.x,y.x), y: max(x.y,y.y), z: max(x.z,y.z))
}
