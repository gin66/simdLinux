import XCTest

#if os(macOS) || os(iOS)
//import simd
#endif
import simdLinux


final class simdTests: XCTestCase {
    func test_cross_01() {
        let x1 = simd_double3(1,0,0)
        let x2 = simd_double3(0,1,0)
        let sol = simd_double3(0,0,1)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_02() {
        let x1 = simd_double3(1,0,0)
        let x2 = simd_double3(1,0,0)
        let sol = simd_double3(0,0,0)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_03() {
        let x1 = simd_double3(0,1,0)
        let x2 = simd_double3(1,0,0)
        let sol = simd_double3(0,0,-1)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_04() {
        let x1 = simd_double3(1,0,0)
        let x2 = simd_double3(0,0,1)
        let sol = simd_double3(0,-1,0)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_05() {
        let x1 = simd_double3(0,1,0)
        let x2 = simd_double3(0,0,1)
        let sol = simd_double3(1,0,0)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }

    func test_matrix_01() {
        let rows = [simd_double3(1,0,0),simd_double3(1,1,0),simd_double3(1,1,1)]
        let vec = simd_double3(1,1,1)
        let m1 = simd_double3x3(rows: rows)

        let res = m1 * vec

        XCTAssertEqual(res[0], 1)
        XCTAssertEqual(res[1], 2)
        XCTAssertEqual(res[2], 3)
    }
    func test_matrix_02() {
        let rows = [simd_double3(1,0,1),simd_double3(1,0,0),simd_double3(1,1,1)]
        let vec = simd_double3(1,1,1)
        let m1 = simd_double3x3(rows: rows)

        let res = m1 * vec

        XCTAssertEqual(res[0], 2)
        XCTAssertEqual(res[1], 1)
        XCTAssertEqual(res[2], 3)
    }
}
