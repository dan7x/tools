import sys
import os
import re
import shutil
import tkinter as tk
from tkinter import filedialog

class CreationError(Exception):
    def __init__(self, message="Creation error"):
        self.message=message
        super().__init__(self.message)


keytok = "\\pvar"

print("Select the folder where you want the assignment to go.")

root = tk.Tk()
root.withdraw()

file_path = filedialog.askdirectory() # Returns opened path as str
if file_path == "":
    raise CreationError("Bad filepath, did not create assignment.")
foldername = input("Assignment folder title (i.e, 'a3'):")

if re.search(r'[^A-Za-z0-9_\-\\]',foldername):
    raise CreationError("Bad folder name; did not create assignment.")

course_title = input("Course (i.e., 'Math 148'):")
ahead = input("Assignment header (i.e., 'Assignment 4'):")

pnums = input("Number of problems:")
try:
    pnums = int(pnums)
except:
    raise CreationError(message="Number of problems must be an integer, did not create assignment.")

template = open("atemp.tex", "r")
temp_raw = template.read()

targ = os.path.join(file_path, foldername).replace("\\","/")
os.mkdir(targ)
shutil.copyfile('dandoc.cls', os.path.join(targ, 'dandoc.cls').replace("\\","/"))

for i in range(0, pnums):
    cp = i + 1
    filename = foldername + "." + str(cp) + ".tex"

    replace_dc = {
        "phead": ahead,
        "pnum": str(cp),
        "pcourse" : course_title
    }
    coutp = temp_raw
    for k, v in replace_dc.items():
        coutp = coutp.replace(keytok + k, v)

    fout = open(os.path.join(file_path, foldername, filename).replace("\\","/"), "x")
    fout.write(coutp)
    fout.close()

template.close()

print("Folder created")

print("Program finished.")