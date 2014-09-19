class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //"/"(view:"/index")
        "/"(controller:"index", action: "index")
        "500"(view:'/error')
	}
}
