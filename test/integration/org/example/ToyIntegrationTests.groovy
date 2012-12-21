package org.example

import grails.test.*

class ToyIntegrationTests extends GroovyTestCase {
    protected void setUp() {
        super.setUp()

		def man = new Manufacturer(name: 'Test Manufacturer1', website: 'www.testman1.com').save()
		
		new Toy(name: 'TestToy1', price: 19.95, minAge: '5', manufacturer: man).save()
		new Toy(name: 'TestToy2', price: 19.95, minAge: '5', manufacturer: man).save()
		new Toy(name: 'TestToy3', price: 29.95, minAge: '5', manufacturer: man).save()
		
		def toyList = Toy.findAll()
		
		assertEquals( 3, toyList.size() )

    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

		def toyList = Toy.findAll()
		
		assertEquals( 2, toyList.size() )
		assertEquals( toyList[0].minAge, '5' )
		assertEquals( toyList[1].manufacturer.name, 'Test Manufacturer1')
    }
}
