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
    public init(x: Int,y: Int,z: Int) {
        self.x = Double(x)
        self.y = Double(y)
        self.z = Double(z)
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

// STUBS ONLY
public func simd_act(_ quat: simd_quatd, _ vector: simd_double3) -> simd_double3 {
    return simd_double3(0,0,0)
}
public func simd_mul(_ left: simd_quatd, _ right: simd_quatd) -> simd_quatd {
    return simd_quatd(0,0,0,0)
}
public func simd_quaternion(_ ang: Double, _ vector: simd_double3) -> simd_quatd {
    return simd_quatd(0,0,0,0)
}
public func simd_mul(_ left: simd_matrix, _ right: simd_double2) -> simd_double2 {
    return simd_double2(0,0)
}
