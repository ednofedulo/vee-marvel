//
//  DetailViewModelTest.swift
//  vee-marvelTests
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import XCTest
@testable import vee_marvel

class DetailViewModelTest: XCTestCase {

    var viewModel:DetailViewModel?
    
    override func setUp() {
        viewModel = DetailViewModel(character: MarvelCharacter(id: 2, name: "test 2", description: "description 2", modified: Date(), thumbnail: Image(path: "", extension: ""), comicList: MarvelCharacter.ComicList(collectionURI: "")))
        viewModel?.service = DetailServiceSuccessMock()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
   func testFetchData() {
       let expectation = self.expectation(description: "fetchData")
       viewModel?.fetchComics()
       expectation.fulfill()
       waitForExpectations(timeout: 3, handler: nil)
       XCTAssertNotNil(viewModel?.comics)
   }

}
