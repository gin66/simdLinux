import Foundation

public typealias simd_float4 = SIMD4<Float>
public typealias simd_double4 = SIMD4<Double>

public extension simd_float4 {
    static let zero = simd_float4(0, 0, 0, 0)
    static let one = simd_float4(1, 1, 1, 1)
}

public extension simd_double4 {
    static let zero = simd_double4(0, 0, 0, 0)
    static let one = simd_double4(1, 1, 1, 1)
}

public struct SIMD4<T>: Codable, Hashable, SIMD where T: AdditiveArithmetic, T: Numeric, T: Codable, T: Hashable, T: Comparable, T: FloatingPoint {

    public typealias Scalar = T

    public var vector: [T]

    var x: T {
        get { return vector[0] }
        set(newX) { vector[0] = newX }
    }

    var y: T {
        get { return vector[1] }
        set(newY) { vector[1] = newY }
    }

    var z: T {
        get { return vector[2] }
        set(newZ) { vector[2] = newZ }
    }

    var w: T {
        get { return vector[3] }
        set(newW) { vector[3] = newW }
    }

    public init(_ x: T, _ y: T, _ z: T, _ w: T) {
        vector = [x, y, z, w]
    }

    public init(x: T, y: T, z: T, w: T) {
        vector = [x, y, z, w]
    }

    public init(_ vector: [T]) {
        self.vector = vector
    }
}
