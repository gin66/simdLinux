import Foundation

public func simd_cross<T: FloatingPoint>(_ left: SIMD3<T>, _ right: SIMD3<T>) -> SIMD3<T> {
    let x = left.y*right.z - left.z*right.y
    let y = left.z*right.x - left.x*right.z
    let z = left.x*right.y - left.y*right.x
    let res = SIMD3<T>(x, y, z)
//    if recording.enable {
//        let entry = SimdRecordingCross(p1: left, p2: right, res: res)
//        recording.append(cross: entry)
//    }
    return res
}

public func simd_act(_ quat: simd_quatd, _ vector: simd_double3) -> simd_double3 {
    // https://en..m.wijipedia.org/wiki/Euler-Rodrigues_formula
    // alternative: https://gamedev.stackexchange.com/questions/28395/rotating-vector3-by-a-quaternion
    let w = simd_double3(quat.ix, quat.iy, quat.iz)
    let w_x = simd_cross(w, vector)
    let w_w_x = simd_cross(w, w_x)
    let res = vector + 2*quat.r*w_x + 2*w_w_x
//    if recording.enable {
//        let entry = SimdRecordingAct(p1: quat, p2: vector, res: res)
//        recording.append(act: entry)
//    }
    return res
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
