package org.example

class Toy {
	
	String		name
	BigDecimal	price
	String		minAge
	
	static belongsTo = [manufacturer: Manufacturer]
	
    static constraints = {
		name blank: false
		price blank: false
    }
}
