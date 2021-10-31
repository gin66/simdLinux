public struct simd_double2: Decodable {
    public var x: Double
    public var y: Double

    public init(_ x: Double,_ y: Double) {
        self.x = x
        self.y = y
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
    public static let zero = simd_double3(0,0,0)
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

public struct simd_quaternion: Decodable {
    public var x: Double
    public var y: Double
    public var z: Double
    public var w: Double

    public init(_ x: Double,_ y: Double,_ z: Double,_ w: Double) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
}


public func simd_dot(_ left: simd_double3, _ right: simd_double3) -> Double {
    return left.x*right.x + left.y*right.y + left.z*right.z
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
public func simd_length(_ vector: simd_double3) -> Double {
    let d2 = vector.x*vector.x + vector.y*vector.y + vector.z*vector.z
    return d2.squareRoot()
}
public func simd_normalize(_ vector: simd_double3) -> simd_double3 {
    let d = simd_length(vector)
    return simd_double3(vector.x/d, vector.y/d, vector.z/d)
}
public func simd_act(_ quat: simd_quaternion, _ vector: simd_double3) -> simd_double3 {
    return simd_double3(0,0,0)
}
