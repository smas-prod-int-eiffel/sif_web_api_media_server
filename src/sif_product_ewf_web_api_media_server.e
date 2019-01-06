note
	description: "Summary description for {SIF_PRODUCT_EWF_WEB_API_MEDIA_SERVER}."
	author: "Paul Gokke"
	date: "$Date$"
	revision: "$Revision$"
	library: ""
	legal: "See notice at end of class."

class
	SIF_PRODUCT_EWF_WEB_API_MEDIA_SERVER

inherit
	SIF_PRODUCT_WEB_EWF
		redefine
			launch,
			is_query_string_based_command_executer,
			query_string_command_field_name,
			has_media,
			manufacture_api_handler,
			initialize
		end

	SHARED_LOG_FACILITY

create
	initialize

feature -- Access

	is_query_string_based_command_executer: BOOLEAN
		do
			Result := true
		end

	query_string_command_field_name: STRING
		do
			Result := "op"
		end

	has_media: BOOLEAN
			-- True, when the web product serves media using the media route as defined by the following features:
			-- media_path and media_query_parameter_name
		do
			Result := True
		end

feature {NONE} -- Manufacturing

	launch
		do
		end

	manufacture_input_validators
			-- Manufacture the input validators
		local
			input_validator : SIF_INPUT_VALIDATOR
		once
			-- Creation of input validators will automatically put the created validators in the shared registry of validators
		end

	do_manufacture_representations
			-- Manufacture the needed representations for the web product.
		do
		end

	is_authorisable: BOOLEAN
		do
			Result := false
		end

	persistence_storage_name: STRING
		do
			Result := internal_persistence_storage_name
		end

	internal_persistence_storage_name: STRING = "media_server"


	version: STRING
			-- Version of the API to be used

	manufacture_api_handler(a_command: SIF_COMMAND[SIF_DAO[ANY]]; a_methods: WSF_REQUEST_METHODS;
							a_resource_path: STRING; a_representation_type: like {SIF_REPRESENTATION_ENUMERATION}.type;
							a_pagination_capable: like {SIF_WEB_API_REQUEST_HANDLER}.pagination_capable;
							a_search: like {SIF_WEB_API_REQUEST_HANDLER}.search)
			-- <Precursor>
			-- *** Use `version' ***
		local
			l_resource_path: STRING
		do
			l_resource_path := "/" + version + a_resource_path
			Precursor (a_command, a_methods, l_resource_path, a_representation_type, a_pagination_capable, a_search)
		end

feature {SIF_SYSTEM_INTERFACE_WEB_EWF,SIF_WEB_API_REQUEST_HANDLER} -- Manufacturing web ewf specific

	do_manufacture_api_handlers
			-- Create the necessary handlers for this web API.
		do
		end

	default_content_type: like {SIF_REPRESENTATION_ENUMERATION}.type
			-- The default content type to use, when none is given by the client
		do
			Result := {SIF_REPRESENTATION_ENUMERATION}.html
		end

feature {NONE} -- Manufacturing

	initialize
		-- <Precursor>
		do
			create version.make_empty
			Precursor
			if version.is_empty then
				version := default_version
			end
		end

	default_version: STRING
			-- The default version, used when no config file is used with version property
		do
			Result := "v1"
		end


feature {NONE} -- Constant Resource paths

note
	copyright: "Copyright (c) 2018, SMA Services"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			SMA Services
			Website: http://www.sma-services.com
		]"

end
