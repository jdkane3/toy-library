package org.example

import grails.test.*

class ManufacturerTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
   }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

		def man = new Manufacturer(name: 'Hasbro', website: 'www.hasbro.com')
		
		assert(man.name == 'Hasbro' && man.website == 'www.hasbro.com')
    }
}
