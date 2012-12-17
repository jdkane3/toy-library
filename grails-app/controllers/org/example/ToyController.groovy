package org.example

class ToyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [toyInstanceList: Toy.list(params), toyInstanceTotal: Toy.count()]
    }

    def create = {
        def toyInstance = new Toy()
        toyInstance.properties = params
        return [toyInstance: toyInstance]
    }

    def save = {
        def toyInstance = new Toy(params)
        if (toyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'toy.label', default: 'Toy'), toyInstance.id])}"
            redirect(action: "show", id: toyInstance.id)
        }
        else {
            render(view: "create", model: [toyInstance: toyInstance])
        }
    }

    def show = {
        def toyInstance = Toy.get(params.id)
        if (!toyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'toy.label', default: 'Toy'), params.id])}"
            redirect(action: "list")
        }
        else {
            [toyInstance: toyInstance]
        }
    }

    def edit = {
        def toyInstance = Toy.get(params.id)
        if (!toyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'toy.label', default: 'Toy'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [toyInstance: toyInstance]
        }
    }

    def update = {
        def toyInstance = Toy.get(params.id)
        if (toyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (toyInstance.version > version) {
                    
                    toyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'toy.label', default: 'Toy')] as Object[], "Another user has updated this Toy while you were editing")
                    render(view: "edit", model: [toyInstance: toyInstance])
                    return
                }
            }
            toyInstance.properties = params
            if (!toyInstance.hasErrors() && toyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'toy.label', default: 'Toy'), toyInstance.id])}"
                redirect(action: "show", id: toyInstance.id)
            }
            else {
                render(view: "edit", model: [toyInstance: toyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'toy.label', default: 'Toy'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def toyInstance = Toy.get(params.id)
        if (toyInstance) {
            try {
                toyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'toy.label', default: 'Toy'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'toy.label', default: 'Toy'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'toy.label', default: 'Toy'), params.id])}"
            redirect(action: "list")
        }
    }
}
