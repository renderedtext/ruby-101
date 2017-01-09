# FindUtil - file search utility

## Description

FindUtil is a minimalistic implementation of GNU find tool, written in
Ruby. Its purpose is to find files. It offers case-(in)sensitive, regex
and/or recursive search.

## Usage

```
Usage: findutil [path] [name/regexp] [parameter(s)]...

Parameters:
  --help, -h
      Show this help message

  --recursive, -r, -R
      Search continues inside subdirectories as well

  --case, -c
      Search will be case-sensitive, don't ignore case

  --regexp, -x
      Search for a file name using a regular expression

Hints:
If path is missing, it will search in the current working directory.
If name/regexp is missing, it will search for all file names.
If no parameters are provided, it will show files in current directory.
Search is not recursive by default, it doesn't search in subdirectories.
Searches are not case sensitive by default, so 'A' is same as 'a'. 
```

## Copyright info

Copyright (C) 2016 Filip Dimovski

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
MA 02110-1301, USA.
