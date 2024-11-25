//
//  ViewControllerTests.swift
//  Arch_pattern_exampleTests
//
//  Created by Alaa Gaber on 23/11/2024.
//

import XCTest
@testable import Arch_pattern_example

final class ViewControllerTests: XCTestCase {

    var sut: TableDataSource!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testCellHeight() throws {
        let vM = TaskListViewModel()
        let sut = TableDataSource(viewModel: vM)
        
        let cellHeight = sut.tableView(.init(), heightForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cellHeight, UITableView.automaticDimension)
        
        let cellHeight2 = sut.tableView(.init(), heightForRowAt: IndexPath(row: 1, section: 0))
        XCTAssertEqual(cellHeight2, UITableView.automaticDimension)
        
        let cellheight3 = sut.tableView(.init(), heightForRowAt: IndexPath(row: 2, section: 0))
        XCTAssertFalse(cellheight3.isEqual(to: 50))
    }
}
