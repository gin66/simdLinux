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
