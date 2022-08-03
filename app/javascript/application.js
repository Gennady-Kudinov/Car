// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

Rails.start()
Turbolinks.start()

