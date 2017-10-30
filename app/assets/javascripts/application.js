// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require ace-rails-ap


$(document).ready(function(){
	rubyEle=document.getElementById("ruby");
	rubyEle.addEventListener("click",function(e){
		e.preventDefault();
		/*console.log("here");
		$('form').attr('action', '/run_ruby');*/
		$('form').submit(function(){
				$('<input />').attr('type', 'hidden')
			          .attr('name', "language")
			          .attr('value', 'ruby')
			          .appendTo('form');
				}
			)
		editor.session.setOptions({
    				mode: "ace/mode/ruby",
    				tabSize: 4,
    				useSoftTabs: true
				});
	})
	cEle=document.getElementById("c");
	cEle.addEventListener("click",function(e){
		e.preventDefault();
		/*$('form').attr('action', '/run_c');*/
		$('form').submit(function(){
				$('<input />').attr('type', 'hidden')
			          .attr('name', "language")
			          .attr('value', 'c')
			          .appendTo('form');
				}
			)
		editor.session.setOptions({
    				mode: "ace/mode/c_cpp",
    				tabSize: 4,
    				useSoftTabs: true
		});
	})
});
