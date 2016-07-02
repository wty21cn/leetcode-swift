#!/usr/bin/python
# -*- coding: utf-8 -*-

from os import path, walk

import platform
import subprocess


class SolutionList:
	def __init__(self):
		self.id = 0
		self.name = ''
		self.problem_url = ''
		self.difficulty = ''
		self.solution_type = ''
		self.solution_url = ''


def compare_solution(a, b):
	if a.id < b.id:
		return -1
	elif a.id == b.id:
		return 0
	else:
		return 1
	
	
def search_swift_source_code(search_path):
	if not path.isdir(search_path):
		return None
	result = []
	for root,dirs,files in walk(search_path):
		for file in files:
			abs_path = path.join(root,file)
			if path.isfile(abs_path) and not path.islink(abs_path):
				if path.splitext(file)[1] == '.swift' and file[0] == 'q':
					result.append(abs_path)
	return result

def build_solution_list(dir_path):
	leetcode_base_url = 'https://leetcode.com/problems/' 
	swift_source_codes = search_swift_source_code(dir_path)
	solution_list = []
	roman_number = set(['i','ii','iii','iv','v','vi','vii','viii','ix','x'])
	for file in swift_source_codes:
		rel_path = path.relpath(path.abspath(file), dir_path)
		file_name = path.splitext(path.basename(rel_path))[0]
		solution = SolutionList()
		
		solution.id = int(file_name.split('-')[0][1:])
		
		n = file_name.split('-')[1:]

		solution.name = ' '.join([s[0].upper()+s[1:] for s in n[:-1]])
		if n[-1] in roman_number:
			solution.name += ' ' + n[-1].upper()
		else:
			solution.name += ' ' + (n[-1][0].upper() + n[-1][1:])
		
		solution.problem_url = leetcode_base_url + file_name[5:]
		
		file_type = path.splitext(path.basename(rel_path))[1][1:]
		solution.solution_type = file_type
		
		solution.difficulty = path.basename(path.dirname(rel_path))
		
		solution.solution_url = './' + rel_path

		solution_list.append(solution)
		
	solution_list.sort(compare_solution)
	return solution_list


def search_readme(search_path):
	if not path.isdir(search_path):
		return None
	readme = None
	readme_header = None
	for root,dirs,files in walk(search_path):
		for file in files:
			abs_path = path.join(root, file)
			if path.isfile(abs_path):
				if file == 'readme-header.md':
					readme_header = abs_path
				elif file == 'README.md':
					readme = abs_path
	if not readme:
		readme = path.join(search_path, 'README.md')
	if not readme_header:
		print("readme-header.md file is missing, README.md auto generation script is stopped!")
		quit()
		
	return (readme, readme_header)
		
def opendir(path):
	if platform.system() == 'Windows':
		startfile(path)
	elif platform.system() == 'Darwin':
		subprocess.Popen(['open', path])
	elif platform.system == 'Linux':
		subprocess.Popen(['xdg-open', path])

def find_project_root_dir(project_name):
		
	current_dir = path.dirname(path.realpath(__file__))  # get script file dir
	xcode_project_name = project_name + '.xcodeproj'
	while not path.exists(path.join(current_dir, xcode_project_name)):
		current_dir = path.dirname(current_dir)
	return current_dir
		
		
def build_readme(dir_path):

	solution_list = build_solution_list(dir_path)
	readme, readme_header = search_readme(dir_path)
	
	with open(readme,'w') as d, open(readme_header,'rU') as s:
		for line in s:
			d.write(line)
	
	#	| # | Title           |  Solution       | Difficulty    | Note         |
	#	|---|---------------- | --------------- | ------------- |--------------|		
		for solution in solution_list:
			markdown_table_str = '| %d ' + '| [%s](%s) ' + '| [%s](%s) ' + '| %s ' + '| %s |\n'
			markdown_table_str = markdown_table_str % (solution.id, solution.name, solution.problem_url, solution.solution_type, solution.solution_url, solution.difficulty, '')
			d.write(markdown_table_str)
	
		
		
if __name__ == '__main__':
		
		project_root_dir = find_project_root_dir('leetcode-swift')
		build_readme(project_root_dir)
		
		print("README.md is successfully genarated.")
		opendir(project_root_dir)
		
		





		
		
