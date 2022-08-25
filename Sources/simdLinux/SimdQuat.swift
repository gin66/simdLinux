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
