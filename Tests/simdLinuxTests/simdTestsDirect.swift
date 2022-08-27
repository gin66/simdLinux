import XCTest

// if creating test cases, use import simd
// while testing, use import simdLinux
//import simd
import simdLinux

final class simdTests: XCTestCase {
    func test_cross_01() {
        let x1 = simd_double3(1, 0, 0)
        let x2 = simd_double3(0, 1, 0)
        let sol = simd_double3(0, 0, 1)
        let r = simd_cross(x1, x2)

        let d = simd_distance(sol, r)
        XCTAssertLessThan(d, 1e-12)
    }

    func test_cross_02() {
        let x1 = simd_double3(1, 0, 0)
        let x2 = simd_double3(1, 0, 0)
        let sol = simd_double3(0, 0, 0)
        let r = simd_cross(x1, x2)

        let d = simd_distance(sol, r)
        XCTAssertLessThan(d, 1e-12)
    }

    func test_cross_03() {
        let x1 = simd_double3(0, 1, 0)
        let x2 = simd_double3(1, 0, 0)
        let sol = simd_double3(0, 0, -1)
        let r = simd_cross(x1, x2)

        let d = simd_distance(sol, r)
        XCTAssertLessThan(d, 1e-12)
    }

    func test_cross_04() {
        let x1 = simd_double3(1, 0, 0)
        let x2 = simd_double3(0, 0, 1)
        let sol = simd_double3(0, -1, 0)
        let r = simd_cross(x1, x2)

        let d = simd_distance(sol, r)
        XCTAssertLessThan(d, 1e-12)
    }

    func test_cross_05() {
        let x1 = simd_double3(0, 1, 0)
        let x2 = simd_double3(0, 0, 1)
        let sol = simd_double3(1, 0, 0)
        let r = simd_cross(x1, x2)

        let d = simd_distance(sol, r)
        XCTAssertLessThan(d, 1e-12)
    }

    func test_matrix_01() {
        let rows = [simd_double3(1, 0, 0), simd_double3(1, 1, 0), simd_double3(1, 1, 1)]
        let vec = simd_double3(1, 1, 1)
        let m1 = simd_double3x3(rows: rows)

        let res = m1 * vec

        XCTAssertEqual(res[0], 1)
        XCTAssertEqual(res[1], 2)
        XCTAssertEqual(res[2], 3)
    }

    func test_matrix_02() {
        let rows = [simd_double3(1, 0, 1), simd_double3(1, 0, 0), simd_double3(1, 1, 1)]
        let vec = simd_double3(1, 1, 1)
        let m1 = simd_double3x3(rows: rows)

        let res = m1 * vec

        XCTAssertEqual(res[0], 2)
        XCTAssertEqual(res[1], 1)
        XCTAssertEqual(res[2], 3)
    }

    func test_simd8_1() {
        let ll4 = simd_int4(3, 2, 1, 0)
        let lh4 = simd_int4(7, 6, 5, 4)
        let v = simd_int8(lowHalf: ll4, highHalf: lh4)

        XCTAssertEqual(v[0], 3)
        XCTAssertEqual(v[1], 2)
        XCTAssertEqual(v[2], 1)
        XCTAssertEqual(v[3], 0)
        XCTAssertEqual(v[4], 7)
        XCTAssertEqual(v[5], 6)
        XCTAssertEqual(v[6], 5)
        XCTAssertEqual(v[7], 4)
    }

    func test_simd8_2() {
        let ll4 = simd_int4(3, 2, 1, 0)
        let lh4 = simd_int4(7, 6, 5, 4)
        let v = simd_int8(lowHalf: ll4, highHalf: lh4)
        let vodd = v.oddHalf
        let veven = v.evenHalf

        XCTAssertEqual(vodd[0], 2)
        XCTAssertEqual(vodd[1], 0)
        XCTAssertEqual(vodd[2], 6)
        XCTAssertEqual(vodd[3], 4)
        XCTAssertEqual(veven[0], 3)
        XCTAssertEqual(veven[1], 1)
        XCTAssertEqual(veven[2], 7)
        XCTAssertEqual(veven[3], 5)
    }

    func test_simd16_1() {
        let ll4 = simd_int4(3, 2, 1, 0)
        let lh4 = simd_int4(7, 6, 5, 4)
        let hl4 = simd_int4(11, 10, 9, 8)
        let hh4 = simd_int4(15, 14, 13, 12)
        let l8 = simd_int8(lowHalf: ll4, highHalf: lh4)
        let h8 = simd_int8(lowHalf: hl4, highHalf: hh4)
        let v = simd_int16(lowHalf: l8, highHalf: h8)

        XCTAssertEqual(v[0], 3)
        XCTAssertEqual(v[1], 2)
        XCTAssertEqual(v[2], 1)
        XCTAssertEqual(v[3], 0)
        XCTAssertEqual(v[4], 7)
        XCTAssertEqual(v[5], 6)
        XCTAssertEqual(v[6], 5)
        XCTAssertEqual(v[7], 4)
        XCTAssertEqual(v[8], 11)
        XCTAssertEqual(v[9], 10)
        XCTAssertEqual(v[10], 9)
        XCTAssertEqual(v[11], 8)
        XCTAssertEqual(v[12], 15)
        XCTAssertEqual(v[13], 14)
        XCTAssertEqual(v[14], 13)
        XCTAssertEqual(v[15], 12)
    }

    func test_simd16_2() {
        let ll4 = simd_int4(3, 2, 1, 0)
        let lh4 = simd_int4(7, 6, 5, 4)
        let hl4 = simd_int4(11, 10, 9, 8)
        let hh4 = simd_int4(15, 14, 13, 12)
        let l8 = simd_int8(lowHalf: ll4, highHalf: lh4)
        let h8 = simd_int8(lowHalf: hl4, highHalf: hh4)
        let v = simd_int16(lowHalf: l8, highHalf: h8)
        let vodd = v.oddHalf
        let veven = v.evenHalf

        XCTAssertEqual(vodd[0], 2)
        XCTAssertEqual(vodd[1], 0)
        XCTAssertEqual(vodd[2], 6)
        XCTAssertEqual(vodd[3], 4)
        XCTAssertEqual(vodd[4], 10)
        XCTAssertEqual(vodd[5], 8)
        XCTAssertEqual(vodd[6], 14)
        XCTAssertEqual(vodd[7], 12)
        XCTAssertEqual(veven[0], 3)
        XCTAssertEqual(veven[1], 1)
        XCTAssertEqual(veven[2], 7)
        XCTAssertEqual(veven[3], 5)
        XCTAssertEqual(veven[4], 11)
        XCTAssertEqual(veven[5], 9)
        XCTAssertEqual(veven[6], 15)
        XCTAssertEqual(veven[7], 13)
    }
}
