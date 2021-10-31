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
