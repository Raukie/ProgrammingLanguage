#include <unordered_map>
#include <string>

#pragma once

/*
	07/01/2023 @Ryan Evertz
	All language definitions
*/
namespace Language
{
	/*All types in the language std::string, And the size of the type in bytes unsigned int*/
	const static std::unordered_map<std::string, unsigned char> Types = {
		{"int",4},
		{"char",1},
		{"void", 0},
	};

	const static std::unordered_map<std::string, unsigned char> Operators = {
		{"+", 0 },
		{"*", 0 },
		{"/", 0 },
		{"-", 0 },
		{"=", 0 },
		{"==", 0 },
		{"&&", 0 },
		{"||", 0 },
	};

	const static std::unordered_map<std::string, unsigned char> Keywords = {
		{"for", 0},
		{"while", 0},
		{"()", 0},

	};
}