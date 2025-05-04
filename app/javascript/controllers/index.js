// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"
import ToggleController from "./toggle_controller"
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

application.register("toggle", ToggleController)
