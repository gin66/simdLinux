import Foundation

public typealias simd_float3 = SIMD3<Float>
public typealias simd_double3 = SIMD3<Double>
public typealias simd_int3 = SIMD3<Int>
public typealias simd_uint3 = SIMD3<UInt>
public typealias simd_long3 = SIMD3<Int>

public struct SIMD3<T>: Codable, Hashable, SIMD where T: Numeric, T: Codable, T: Hashable, T: Comparable {
    public typealias Scalar = T

    public var vector: [T]
    public static var scalarCount: Int { get { return 3 } }

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

    public init(_ vector: [T]) {
        self.vector = vector
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD3(vector:)")
        }
    }
}
