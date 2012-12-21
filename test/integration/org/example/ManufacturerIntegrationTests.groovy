package org.example

import grails.test.*

class ManufacturerIntegrationTests extends GroovyTestCase {
    protected void setUp() {
        super.setUp()

		def toy = new Toy(name: 'TestToy1', price: 19.95, minAge: '5').save()

		new Manufacturer(name: 'Test Manufacturer1', website: 'www.testman1.com').save()
		new Manufacturer(name: 'Test Manufacturer2', website: 'www.testman2.com').save()
		new Manufacturer(name: 'Test Manufacturer3', website: 'www.testman3.com').save()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

		def manList = Manufacturer.findAllByNameLike('T%')
		
		assert manList.size() == 3
		assert manList[0].name == 'Test Manufacturer1'
    }
}
