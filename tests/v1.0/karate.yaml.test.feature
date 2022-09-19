
Feature: Basic

# The secrects can be used in the payload with the following syntax #(mysecretname)
Background:


Scenario: get request

	Given url karate.properties['testURL']

	And path '/'
	And header Direktiv-ActionID = 'development'
	And header Direktiv-TempDir = '/tmp'
	And request
	"""
	{
		"convert": "data.xlsx",
		"commands": [
		{
			"command": "csvjson out/instance/out.csv",
			"silent": false,
			"print": true,
		}
		]
	}
	"""
	When method POST
	Then status 200
	And match $ ==
	"""
	{
	"csvkit": [
	{
		"result": "#notnull",
		"success": true
	}
	]
	}
	"""
	