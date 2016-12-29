# FindUtil - minimal implementation of GNU find in Ruby

## Description

FindUtil is a minimal implementation of GNU find tool, written in Ruby.

## Usage

```
Usage: findutil [path] [parameter(s)]...

Parameters:
  --version
      Shows the version of this program
  --help
      Show this help text
  -r, -R, --recursive
      Search continues within subdirectories as well (default)
  -nr, --no-recursive
      Search happens only within current directory, do not recurse
  -iregex REGEXP
      Search for a file name using regular expression, case-insensitive
  -regex REGEXP
      Search for a file name using regular expression, case-sensitive
  -iname NAME
      Search for a file name using shell globs, case-insensitive
  -name NAME
      Search for a file name using shell globs, case-sensitive
  --tux
      Gives a blessing from our favorite Linux penguin :)
```

## Copyright info

Copyright (C) 2016 Filip Dimovski.

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
