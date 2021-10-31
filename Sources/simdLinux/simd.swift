public struct simd_double2: Decodable {
    public var x: Double
    public var y: Double
}
public struct simd_double3: Decodable {
    public var x: Double
    public var y: Double
    public var z: Double

    public init(_ x: Double,_ y: Double,_ z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
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
    static func - (left: simd_double3, right: simd_double3) -> simd_double3 {
        return simd_double3(left.x - right.x, left.y - right.y, left.z - right.z)
    }
    static prefix func - (vector: simd_double3) -> simd_double3 {
        return simd_double3(-vector.x, -vector.y, -vector.z)
    }
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
    return simd_double3(min(x.x,y.x), min(x.y,y.y), min(x.z,y.z))
}
public func simd_max(_ x: simd_double3, _ y: simd_double3) -> simd_double3 {
    return simd_double3(max(x.x,y.x), max(x.y,y.y), max(x.z,y.z))
}
