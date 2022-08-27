import Foundation

public typealias simd_float4 = SIMD4<Float>
public typealias simd_double4 = SIMD4<Double>
public typealias simd_int4 = SIMD4<Int>
public typealias simd_uint4 = SIMD4<UInt>
public typealias simd_long4 = SIMD4<Int>

public struct SIMD4<T>: Codable, Hashable, SIMD where T: Numeric, T: Codable, T: Hashable, T: Comparable {

    public typealias Scalar = T

    public var vector: [T]
    public static var scalarCount: Int { get { return 4 } }

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

    public var w: T {
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
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD4(vector:)")
        }
    }
}
