import Foundation

public typealias simd_float3 = SIMD3<Float>
public typealias simd_double3 = SIMD3<Double>

public extension simd_float3 {
    static let zero = simd_float3(0, 0, 0)
    static let one = simd_float3(1, 1, 1)
}

public extension simd_double3 {
    static let zero = simd_double3(0, 0, 0)
    static let one = simd_double3(1, 1, 1)
}

public struct SIMD3<T>: Codable, Hashable, SIMD where T: AdditiveArithmetic, T: Numeric, T: Codable, T: Hashable, T: Comparable, T: FloatingPoint {
    public typealias Scalar = T

    public var vector: [T]
    public let scalarCount = 3

    public var x: T {
        get { return vector[0] }
        set(newX) { vector[0] = newX }
    }

    public var y: T {
        get { return vector[1] }
        set(newY) { vector[1] = newY }
    }

    public var z: T {
        get { return vector[2] }
        set(newZ) { vector[2] = newZ }
    }

    public init(_ x: T, _ y: T, _ z: T) {
        vector = [x, y, z]
    }

    public init(x: T, y: T, z: T) {
        vector = [x, y, z]
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
