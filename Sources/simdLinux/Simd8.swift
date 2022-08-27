import Foundation

public typealias simd_float8 = SIMD8<Float>
public typealias simd_double8 = SIMD8<Double>
public typealias simd_uint8 = SIMD8<UInt>
public typealias simd_long8 = SIMD8<Int>

public struct SIMD8<T>: Codable, Hashable, SIMD where T: Numeric, T: Codable, T: Hashable, T: Comparable {

    public typealias Scalar = T

    public var vector: [T]
    public static var scalarCount: Int { get { return 8 } }

    public init(v0: T, v1: T, v2: T, v3: T, v4: T, v5: T, v6: T, v7: T) {
        vector = [v0,v1,v2,v3,v4,v5,v6,v7]
    }

    public init(_ vector: [T]) {
        self.vector = vector
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD8(vector:)")
        }
    }
}
