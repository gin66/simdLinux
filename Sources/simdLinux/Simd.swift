import Foundation

public struct simd_matrix: Codable, Hashable {
    public var c1: simd_double2
    public var c2: simd_double2

    public init(_ c1: simd_double2, _ c2: simd_double2) {
        self.c1 = c1
        self.c2 = c2
    }
}

public func simd_mul(_ left: simd_matrix, _ right: simd_double2) -> simd_double2 {
    let x = left.c1.x*right.x + left.c2.x*right.y
    let y = left.c1.y*right.x + left.c2.y*right.y
    return simd_double2(x, y)
}

public func simd_quaternion(_ ang: Double, _ vector: simd_double3) -> simd_quatd {
    let n = simd_normalize(vector)
    let c = cos(ang/2)
    let s = sin(ang/2)
    let ix = n.x*s
    let iy = n.y*s
    let iz = n.z*s
    return simd_quatd(ix, iy, iz, c)
}

public func simd_mul(_ left: simd_quatd, _ right: simd_quatd) -> simd_quatd {
    // Hamilton product https://en.wikipedia.org/wiki/Quaternion
    let a1 = left.r
    let a2 = right.r
    let b1 = left.ix
    let b2 = right.ix
    let c1 = left.iy
    let c2 = right.iy
    let d1 = left.iz
    let d2 = right.iz
    let r = a1*a2 - b1*b2 - c1*c2 - d1*d2
    let ix = a1*b2 + b1*a2 + c1*d2 - d1*c2
    let iy = a1*c2 - b1*d2 + c1*a2 + d1*b2
    let iz = a1*d2 + b1*c2 - c1*b2 + d1*a2
    let res = simd_quatd(ix, iy, iz, r)
//    if recording.enable {
//        let entry = SimdRecordingMul(p1: left, p2: right, res: res)
//        recording.append(mul: entry)
//    }
    return res
}

