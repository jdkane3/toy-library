package org.example

import grails.test.*

class ToyTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

		def toy = new Toy(name: 'TestToy', price: 10.00, minAge: '5')
		
		toy.manufacturer = new Manufacturer(name: 'TestMan', website: 'www.test.com')
		
		assertEquals('TestToy', toy.name)
		assertEquals('TestMan', toy.manufacturer.name)

	}
}
