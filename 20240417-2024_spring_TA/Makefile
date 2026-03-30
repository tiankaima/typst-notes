DIR_NAME := $(notdir $(CURDIR))

main: main_ hw16_17 function_analysis_intro lecture_9 hw_list

main_: main.typ
	typst compile --font-path ../fonts/ ./main.typ ../build/$(DIR_NAME).pdf

hw16_17: hw16_17.typ
	typst compile --font-path ../fonts/ ./hw16_17.typ ../build/$(DIR_NAME)_hw16_17.pdf

function_analysis_intro: function_analysis_intro.typ
	typst compile --font-path ../fonts/ ./function_analysis_intro.typ ../build/$(DIR_NAME)_function_analysis_intro.pdf

lecture_9: lecture_9.typ
	typst compile --font-path ../fonts/ ./lecture_9.typ ../build/$(DIR_NAME)_lecture_9.pdf

hw_list: hw_list.typ
	typst compile --font-path ../fonts/ ./hw_list.typ ../build/$(DIR_NAME)_hw_list.pdf