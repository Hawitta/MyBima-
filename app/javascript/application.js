// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import Rails from "@rails/ujs"
Rails.start()

window.Rails = Rails; // Ensure it's available globally
console.log("Rails UJS loaded:", Rails);
import "signature"
