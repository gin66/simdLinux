import Foundation

public typealias simd_quatf = QUAT4<Float>
public typealias simd_quatd = QUAT4<Double>

public extension simd_quatf {
    static let zero = simd_quatf(0, 0, 0, 0)
    static let one = simd_quatf(1, 1, 1, 1)
}

public extension simd_quatd {
    static let zero = simd_quatd(0, 0, 0, 0)
    static let one = simd_quatd(1, 1, 1, 1)
}

public struct QUAT4<T>: Codable, Hashable, SIMD where T: AdditiveArithmetic, T: Numeric, T: Codable, T: Hashable, T: Comparable, T: FloatingPoint {
    public typealias Scalar = T

    public var vector: [T]
    public let scalarCount = 4

    var ix: T {
        get { return vector[0] }
        set(newX) { vector[0] = newX }
    }

    var iy: T {
        get { return vector[1] }
        set(newY) { vector[1] = newY }
    }

    var iz: T {
        get { return vector[2] }
        set(newZ) { vector[2] = newZ }
    }

    var r: T {
        get { return vector[3] }
        set(newR) { vector[3] = newR }
    }

    public init(from v1: SIMD3<T>, to v2: SIMD3<T>) {
        let rot = simd_cross(v1, v2)
        let norm = simd_length(v1) * simd_length(v2)
        let sinA = simd_length(rot) / norm
        let cosA = simd_dot(v1, v2) / norm

        let ix = rot.x * sinA
        let iy = rot.y * sinA
        let iz = rot.z * sinA
        let r = cosA
        vector = [ix, iy, iz, r]
    }

    public var axis: SIMD3<T> { return SIMD3<T>(ix, iy, iz) }
    var angle: T {
        if let rf = r as? Float {
            return (acos(rf) * 2) as! T
        }
        if let rd = r as? Double {
            return acos(rd) * 2 as! T
        }
        return 0
    }

    public init(_ ix: T, _ iy: T, _ iz: T, _ r: T) {
        vector = [ix, iy, iz, r]
    }

    public init(ix: T, iy: T, iz: T, r: T) {
        vector = [ix, iy, iz, r]
    }

    public init(from decoder: Decoder) throws {
        vector = try Array<T>.init(from: decoder)
    }

    public func encode(to encoder: Encoder) throws {
        try vector.encode(to: encoder)
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD2(vector:)")
        }
    }

    public init(_ vector: [T]) {
        self.vector = vector
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD2(vector:)")
        }
    }
}
