import Foundation

public typealias simd_float2 = SIMD2<Float>
public typealias simd_double2 = SIMD2<Double>
public typealias simd_int2 = SIMD2<Int>
public typealias simd_uint2 = SIMD2<UInt>
public typealias simd_long2 = SIMD2<Int>

public struct SIMD2<T>:  Codable, Hashable, SIMD where T: Numeric, T: Codable, T: Hashable, T: Comparable {
    public typealias Scalar = T

    public var vector: [T]
    public static var scalarCount: Int { get { return 2 } }

    public var x: T {
        get { return vector[0] }
        set(newX) { vector[0] = newX }
    }

    public var y: T {
        get { return vector[1] }
        set(newY) { vector[1] = newY }
    }

    public init(_ x: T, _ y: T) {
        vector = [x, y]
    }

    public init(x: T, y: T) {
        vector = [x, y]
    }

    public init(_ vector: [T]) {
        self.vector = vector
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD2(vector:)")
        }
    }
}
