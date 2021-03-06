###
    Load Dependencies
###
Hooks = require( "wp_hooks" )
$ = require( 'jQuery' )


# Expose some Photography Portfolio modules to the public for extensibility
window.PP_Modules =
	# Extend Portfolio Interface to build custom portfolio layouts based on PP Events
	Portfolio_Interface: require( './portfolio/Portfolio_Interface' )

	# Use `Item_Data` to get formatted item image sizes for lazy laoding
	Item_Data: require( './lazy/Item_Data' )

	# Extend Abstract_Lazy_Loder to implement lazy loader for your layout
	Abstract_Lazy_Loader: require( './lazy/Abstract_Lazy_Loader' )

###
	Includes
###

# Start Portfolio
require './portfolio/start'

# Gallery
require './gallery/popup'

# Lazy Loading
require './lazy/start'




###
	Boot on `document.ready`
###
$( document ).ready ->

	# Only run this script when body has `PP_Portfolio` class
	return if not $( 'body' ).hasClass( 'PP_Portfolio' )

	# Boot
	Photography_Portfolio = new ( require( './core/Photography_Portfolio' ) )()
	Photography_Portfolio.ready()

	return