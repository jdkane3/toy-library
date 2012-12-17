package org.example

class Manufacturer {
	
	String name
	String website
	
	static hasMany = [toys: Toy]

    static constraints = {
		name: blank: false
    }
}
