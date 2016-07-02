#!/usr/bin/python
# -*- coding: utf-8 -*-

from os import path, makedirs, mkdir, listdir, walk, remove, symlink, chdir
from shutil import rmtree

import subprocess
import platform
import re
import os


def make_centralized_solution_links(dir_path):
    if path.exists(dir_path):
        rmtree(dir_path)
    makedirs(dir_path)

    swift_source_codes = search_swift_source_code('./')
    for file in swift_source_codes:
        
        re_str = re.compile('^q')
        symlink_name = re_str.sub('L', path.basename(file))
        print(symlink_name)
        
        rel_path = path.relpath(path.abspath(file), dir_path)
        print(path.join(dir_path, symlink_name) + ' ---> ' + rel_path)
        symlink(rel_path, path.join(dir_path, symlink_name))
    print('Total %d symbolic links created in directory "%s"' % (len(swift_source_codes), path.abspath(dir_path)))


def make_category_solution_links(dir_path):
    if path.exists(dir_path):
        rmtree(dir_path)
    makedirs(dir_path)
    
    swift_source_codes = search_swift_source_code('./')
    indicator = '//  Category*'
    category_num = 0
    symlink_num = 0
    
    for file in swift_source_codes:
        with open(file, 'rU') as f:
            for line in f:
                if line.startswith(indicator):
                    categories = list(set(line.replace('\n','').split(' ')).difference(set(['//','Category*',':',''])))
                    for category in categories:
                        category_dir_path = path.join(dir_path, category)
                        if not path.exists(category_dir_path):
                            mkdir(category_dir_path)
                            category_num += 1
                        
                        re_str = re.compile('^q')
                        symlink_name = re_str.sub('L', path.basename(file))
                        
                        rel_path = path.relpath(path.abspath(file), category_dir_path)
                        print(path.join(category_dir_path, path.basename(file)) + ' ---> ' + rel_path)
                        symlink(rel_path, path.join(category_dir_path, symlink_name))
                        symlink_num += 1
                    break
    print('Total %d symbolic links of %d categories created in directory "%s"' % (symlink_num, category_num, path.abspath(dir_path)))
        
    
def search_swift_source_code(searchPath):
    if not path.isdir(searchPath):
        return None
    result = []
    for root,dirs,files in walk(searchPath):
        for file in files:
            abs_path = path.join(root,file)
            if path.isfile(abs_path) and not path.islink(abs_path):
                if path.splitext(file)[1] == '.swift' and file[0] == 'q':    
                    result.append(abs_path)
    return result
                   

def opendir(path):
    if platform.system() == 'Windows':
        os.startfile(path)
    elif platform.system() == 'Darwin':
        subprocess.Popen(['open', path])
    elif platform.system == 'Linux':
        subprocess.Popen(['xdg-open', path])
        
        
def find_proiject_root_dir(project_name):
    
    current_dir = path.dirname(path.realpath(__file__))  # get script file dir
    xcode_project_name = project_name + '.xcodeproj'
    while not path.exists(path.join(current_dir, xcode_project_name)):
        current_dir = path.dirname(current_dir)
    print(current_dir)
    chdir(current_dir)


if __name__ == '__main__':
    
    find_proiject_root_dir('leetcode-swift')
    
    topdir = './solution-links'
    centrailized_solution_links_dir = path.join(topdir,'centralized')
    category_solution_links_dir    = path.join(topdir,'category')

    make_centralized_solution_links(centrailized_solution_links_dir)
    make_category_solution_links(category_solution_links_dir)
    
    opendir(topdir)
    
    



    


	