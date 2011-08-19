#!/usr/bin/python

import os

for root,dirs,files in os.walk("."):
	for file in files:
		if file.endswith('.el'):
			if not file.startswith("gx"):
				continue
			suffix = file.split("-")[0]
			name = file.split("-")[1]
			if suffix == "gx":
				file1 = "my-" + name
				cmd = "mv %s %s" %(file, file1)
				os.system(cmd)
			
			#suffix = file.split()
				

