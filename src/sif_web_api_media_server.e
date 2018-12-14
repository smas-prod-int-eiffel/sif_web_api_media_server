note
	description: "Summary description for {SIF_WEB_API_MEDIA_SERVER}."
	author: "Paul Gokke"
	date: "$Date$"
	revision: "$Revision$"
	legal: "See notice at end of class."

class
	SIF_WEB_API_MEDIA_SERVER

inherit
	EWF_SIF_SERVER_EXECUTER [SIF_PRODUCT_EWF_WEB_API_MEDIA_SERVER]
		redefine
			initialize
		end

create
	make

feature {NONE} -- Initialization

	initialize
		do
			set_service_option ("keep_alive_timeout", 1)
			set_service_option ("max_keep_alive_requests", 0)
		end

note
	copyright: "Copyright (c) 2018, SMA Services"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			SMA Services
			Website: http://www.sma-services.com
		]"

end
