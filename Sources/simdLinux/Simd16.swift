import Foundation

public typealias simd_uint16 = SIMD16<UInt>
public typealias simd_long16 = SIMD16<Int>

public struct SIMD16<T>: Codable, Hashable, SIMD where T: Numeric, T: Codable, T: Hashable, T: Comparable {

    public typealias Scalar = T

    public var vector: [T]
    public static var scalarCount: Int { get { return 8 } }

    public init(v0: T, v1: T, v2: T, v3: T, v4: T, v5: T, v6: T, v7: T, v8: T, v9: T, v10: T, v11: T, v12: T, v13: T, v14: T, v15: T) {
        vector = [v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15]
    }

    public init(_ vector: [T]) {
        self.vector = vector
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD8(vector:)")
        }
    }
}
